<?php

// include required classes
require_once('../database.class.php');
require_once('../demomap.class.php');

$lat = $_POST['lat'];
$lng = $_POST['lng'];

$db = Database::get('default');
$obj = new Demomap($db); 
$events = $obj->getEventsByGeolocation($lat,$lng);

$content = '<a href="#" class="close-overlay">schließen</a>';

foreach ($events as $event) {
	
	$id = $event['id'];
	$content .= '<h2>' . $event['event_name'] . '</h2>';
	$content .= '<div class="event-details">';
	$content .= '<strong>Jahr:</strong> ' . $event['event_date'] . ', <strong>Ort:</strong> ' . $event['country'] . ', ' . $event['city'];
	$content .= '</div>';	
	
	$demos = $obj->getDemosFromEvent($id);
	
	$content .= '<div class="demolist">';
 	foreach ($demos as $demo) {
		$content .= '<a href="#" class="open-demo-details" data-demo-id="'.$demo['id'].'" data-demo-name="'.$demo['name'].'">' . $demo['name'] . '</a>';
	}
	$content .= '</div>';
	
}

echo $content;

?>