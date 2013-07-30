<?php
class Demomap {

	protected $_db;

    public function __construct(Database $db)
    {
        $this->_db = $db;
    }
    
    public function getEffectsByDemo($id) {
	   	$params = array(
    		':id' => $id);       
    	$sql = "SELECT * FROM demos_has_effects WHERE demo_id = :id";
		$data = $this->_db->select($sql,$params);
		return $data;	    
    }
    
    public function getEffectTagByID($id) {
	   	$params = array(
    		':id' => $id);       
    	$sql = "SELECT * FROM effects WHERE id = :id";
		$data = $this->_db->selectSingle($sql,$params);
		return $data;	    
    }
    
    public function getEventsByGeolocation($lat,$lng) {
	   	$params = array(
    		':lat' => $lat,
    		':lng' => $lng);       
    	$sql = "SELECT * FROM events WHERE lat = :lat AND lng = :lng";
		$data = $this->_db->select($sql,$params);
		return $data;	    
    }
    
    public function getDemosFromEvent($id) {
	   	$params = array(
    		':id' => $id);       
    	$sql = "SELECT * FROM demos WHERE events_id = :id";
		$data = $this->_db->select($sql,$params);
		return $data;	        	
	}    
    
    public function getAllEventsGroupedByGeolocation() {
    	$locations = array();
    	$sql = "SELECT DISTINCT lat,lng,city,country FROM events";
		$results = $this->_db->select($sql);
		foreach ($results as $result) {
			$lat = $result['lat'];
			$lng = $result['lng'];
			$city = $result['city'];
			$country = $result['country'];						
			$events = $this->getEventsByGeolocation($lat,$lng);
			$location_set = array('lat' => $lat, 'lng' => $lng, 'city' => $city, 'country' => $country, 'events' => $events);
			array_push($locations, $location_set);
		}
		return $locations;
    }   		    	   
}
?>