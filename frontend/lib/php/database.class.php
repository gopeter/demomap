<?php
/*
 * PDO class
 * inspired by http://pastebin.com/9pyPrQfk
 */

class Database
{

    protected static $dbConf = array(
    	"default" => array(
    		"type" => "mysql",
    		"config" => "host=localhost;dbname=XXX;port=XXX",
    		"user" => "XXX",
    		"password" => "XXX") 
    );
    
    protected $active = false;
    protected $dbHandle = null;
    protected $lastInsertId = false;
    protected $rowCount = false;
    protected $queryCounter = 0;
    protected static $instances = array();

    public static function get($active = "default")
    {
        if (!isset(self::$dbConf[$active])) {
	        throw new Exception("Unexisting db-config $active");
	    }

        if (!isset(self::$instances[$active]))
            self::$instances[$active] = new Database($active);

        return self::$instances[$active];
    }

    private function __clone()
    {

    }

    protected function __construct($active)
    {
        if (!isset(self::$dbConf[$active]))
            throw new PDOException("No supported connection scheme");

        $dbConf = self::$dbConf[$active];

        try
        {
            //Connect
            if ($active == 'default') {
	            $db = new PDO($dbConf['type'].":".$dbConf['config'],$dbConf['user'],$dbConf['password']);
	        } else if ($active == 'sqlite') {
	            $db = new PDO($dbConf['type'].":".$dbConf['config']);		        
	        } else {
	            throw new PDOException("No Database connection");		        
	        }
	        
            //error behaviour
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            if ($active == 'default') {
	            $db->query("set character set utf8");
	            $db->query("set names utf8");
	        }
            
            $this->dbHandle = $db;
            $this->active = $active; //mark as active
        } catch (PDOException $ex)
        {
            throw new PDOException("Connection Exception: " . $ex->getMessage());
        }
    }

    public function disconnect()
    {
        $this->dbHandle = null;
        unset(self::$instances[$this->active]);
    }

    public function getHandle()
    {
        return $this->dbHandle;
    }

    public function lastInsertId()
    {
        return $this->lastInsertId;
    }

    public function rowCount()
    {
        return $this->rowCount;
    }

    protected function _query($qry, array $params, $type)
    {
        if (in_array($type, array("insert", "select", "update", "delete")) === false)
            throw new Exception("Unsupported Query Type");

        $this->lastInsertId = false;
        $this->rowCount = false;

        $stmnt = $this->dbHandle->prepare($qry);

        try
        {
            $success = (count($params) !== 0) ? $stmnt->execute($params) : $stmnt->execute();
            $this->queryCounter++;

            if (!$success)
                return false;

            if ($type === "insert")
                $this->lastInsertId = $this->dbHandle->lastInsertId();
            $this->rowCount = $stmnt->rowCount();

            return ($type === "select") ? $stmnt : true;
        } catch (PDOException $ex)
        {
            throw new PDOException("PDO-Exception: " . $ex->getMessage());
        }
    }

    protected function getQueryType($qry)
    {
        list($type, ) = explode(" ", strtolower($qry), 2);
        return $type;
    }

    public function delete($qry, array $params = array())
    {
        if (($type = $this->getQueryType($qry)) !== "delete")
            throw new Exception("Incorrect Delete Query");

        return $this->_query($qry, $params, $type);
    }

    public function update($qry, array $params = array())
    {
        if (($type = $this->getQueryType($qry)) !== "update")
            throw new Exception("Incorrect Update Query");

        return $this->_query($qry, $params, $type);
    }

    public function insert($qry, array $params = array())
    {
        if (($type = $this->getQueryType($qry)) !== "insert")
            throw new Exception("Incorrect Insert Query");

        return $this->_query($qry, $params, $type);
    }

    public function select($qry, array $params = array())
    {
        if (($type = $this->getQueryType($qry)) !== "select")
            throw new Exception("Incorrect Select Query");

        if ($stmnt = $this->_query($qry, $params, $type))
        {
            return $stmnt->fetchAll(PDO::FETCH_ASSOC);
        } else
        {
            return false;
        }
    }

    public function selectSingle($qry, array $params = array(), $field = false)
    {
        if (($type = $this->getQueryType($qry)) !== "select")
            throw new Exception("Incorrect Select Query");

        if ($stmnt = $this->_query($qry, $params, $type))
        {
            $res = $stmnt->fetch(PDO::FETCH_ASSOC);
            return ($field === false) ? $res : $res[$field];
        } else
        {
            return false;
        }
    }

    public function query($qry)
    {
        $this->lastInsertId = false;
        $this->rowCount = false;
        $this->rowCount = $this->dbHandle->exec($qry);
        $this->queryCounter++;
    }

    public function getQueryCounter()
    {
        return $this->queryCounter;
    }

    public function quote($str)
    {
        return $this->dbHandle->quote($str);
    }

}