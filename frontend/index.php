<?php

// include required classes
require_once('lib/php/database.class.php');
require_once('lib/php/demomap.class.php');
?>

<!DOCTYPE html>
<html lang="de">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Demomap</title>

	<link href="lib/css/style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="lib/js/jquery.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=<?php echo $language; ?>"></script>
	<script type="text/javascript" src="lib/js/markers.js"></script>
	<script type="text/javascript" src="lib/js/lib.js"></script>			
	<script type="text/javascript">

	// google maps init function
	var initial_center = new google.maps.LatLng(51.165691, 10.451526);
	var initial_zoom = 6;
	var zoomLevel = 1;	
	
	function initializeGoogleMaps() {	
        geocoder = new google.maps.Geocoder();

		// map styles
		// comment/uncomment to change style
		
		var color=[{featureType:"water",stylers:[{color:"#A7C1E0"}]},{featureType:"landscape.man_made",elementType:"geometry",stylers:[{visibility:"on"},{hue:"#ff8000"},{saturation:2},{lightness:-4}]},{featureType:"poi.park",stylers:[{hue:"#91ff00"},{saturation:15},{lightness:0}]},{featureType:"road",elementType:"labels",stylers:[{hue:"#000000"},{saturation:-100},{gamma:2},{lightness:"10"}]},{featureType:"road.arterial",elementType:"geometry",stylers:[{visibility:"simplified"},{saturation:59},{hue:"#00fff7"},{lightness:87},{gamma:3.82}]},{featureType:"road.highway",elementType:"geometry",stylers:[{visibility:"on"},{saturation:59},{hue:"#00fff7"},{lightness:87},{gamma:3.82}]}];
		
		//var color=[{stylers:[{hue:"#00b1ff"},{invert_lightness:true}]},{featureType:"water",stylers:[{hue:"#009aff"},{saturation:75},{lightness:-64}]},{featureType:"administrative",elementType:"geometry",stylers:[{visibility:"off"}]},{featureType:"administrative",elementType:"labels",stylers:[{hue:"#00bfff"},{saturation:38},{lightness:-50}]},{featureType:"administrative.province",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"landscape.man_made",stylers:[{hue:"#00bfff"},{saturation:48},{lightness:-5}]},{featureType:"landscape.natural",stylers:[{hue:"#00bfff"},{saturation:48},{lightness:5}]},{featureType:"administrative.land_parcel",stylers:[{visibility:"off"}]},{featureType:"administrative.neighborhood",stylers:[{visibility:"off"}]},{featureType:"landscape.man_made",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi",elementType:"geometry",stylers:[{hue:"#00bfff"},{saturation:18},{lightness:-99},{gamma:4}]},{featureType:"poi.medical",elementType:"geometry",stylers:[{visibility:"on"},{lightness:-10}]},{featureType:"poi.government",elementType:"geometry",stylers:[{hue:"#00bfff"},{saturation:28},{lightness:4}]},{featureType:"poi.attraction",stylers:[{visibility:"off"}]},{featureType:"poi.business",stylers:[{visibility:"off"}]},{featureType:"poi.government",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi.government",elementType:"geometry",stylers:[{hue:"#00bfff"},{saturation:28},{lightness:-30}]},{featureType:"poi.park",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi.park",elementType:"geometry",stylers:[{hue:"#00bfff"},{saturation:28},{lightness:-30}]},{featureType:"poi.place_of_worship",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi.school",stylers:[{visibility:"off"}]},{featureType:"poi.sports_complex",stylers:[{visibility:"off"}]},{featureType:"road.local",elementType:"labels",stylers:[{hue:"#00bfff"},{saturation:48},{lightness:-60}]},{featureType:"road.local",elementType:"geometry",stylers:[{visibility:"simplified"}]},{featureType:"road.arterial",elementType:"labels",stylers:[{hue:"#00bfff"},{saturation:28},{lightness:-60}]},{featureType:"road.arterial",elementType:"geometry",stylers:[{visibility:"simplified"},{hue:"#00bfff"},{saturation:28},{lightness:-70}]},{featureType:"road.highway",elementType:"geometry",stylers:[{visibility:"simplified"},{hue:"#00bfff"},{saturation:38},{lightness:-60}]},{featureType:"road.highway",elementType:"labels",stylers:[{hue:"#00bfff"},{saturation:28},{lightness:-70}]},{featureType:"transit",elementType:"geometry",stylers:[{visibility:"off"}]},{featureType:"transit",elementType:"labels",stylers:[{visibility:"simplified"},{hue:"#00bfff"},{saturation:18},{lightness:-50}]}];
		
		//var color=[{featureType:"water",stylers:[{hue:"#00ffe0"},{saturation:-60},{lightness:0}]},{featureType:"landscape.man_made",elementType:"geometry",stylers:[{visibility:"on"},{hue:"#ffbf00"},{saturation:-25},{lightness:40}]},{featureType:"landscape.natural",elementType:"geometry",stylers:[{hue:"#bdff00"},{saturation:-35},{lightness:20}]},{featureType:"administrative",elementType:"labels",stylers:[{saturation:-90},{lightness:30}]},{featureType:"administrative.land_parcel",stylers:[{visibility:"on"}]},{featureType:"administrative.neighborhood",stylers:[{visibility:"off"}]},{featureType:"landscape.man_made",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi",elementType:"labels",stylers:[{saturation:-90},{lightness:30}]},{featureType:"poi.park",stylers:[{hue:"#bdff00"},{saturation:-35},{lightness:3}]},{featureType:"poi.business",stylers:[{visibility:"off"}]},{featureType:"poi.sports_complex",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi.government",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"poi.medical",stylers:[{visibility:"on"},{hue:"#ff1b00"},{saturation:-10},{lightness:10}]},{featureType:"poi.school",stylers:[{visibility:"on"},{hue:"#ffbe00"},{saturation:-10},{lightness:0}]},{featureType:"road",elementType:"labels",stylers:[{hue:"#000000"},{saturation:-100},{gamma:2},{visibility:"on"}]},{featureType:"road.arterial",elementType:"geometry",stylers:[{visibility:"simplified"},{saturation:-100},{hue:"#00fff7"},{lightness:20}]},{featureType:"road.arterial",elementType:"labels",stylers:[{visibility:"on"},{saturation:-100},{hue:"#00fff7"},{lightness:20}]},{featureType:"road.local",elementType:"geometry",stylers:[{visibility:"simplified"},{saturation:-100},{hue:"#00fff7"},{lightness:-10}]},{featureType:"road.local",elementType:"labels",stylers:[{visibility:"off"}]},{featureType:"road.highway",elementType:"geometry",stylers:[{visibility:"simplified"},{saturation:-90},{hue:"#ffcc00"},{lightness:5}]},{featureType:"road.highway",elementType:"labels",stylers:[{visibility:"simplified"},{saturation:30},{hue:"#ff0e00"},{lightness:0}]},{featureType:"transit",stylers:[{visibility:"off"}]},{featureType:"poi.place_of_worship",elementType:"labels",stylers:[{visibility:"off"}]}]		

		
		// create styled map object
		var coloredMap = new google.maps.StyledMapType(color, {name: "color"});
		
		// define map options
		var mapOptions = {
			zoom: initial_zoom,
			minZoom: 4,
			disableDefaultUI: true,
			center: initial_center
		};
		
		// create new map
		map = new google.maps.Map(document.getElementById('canvas'), mapOptions); 

		// apply map styles
		map.mapTypes.set('color', coloredMap);			
		map.setMapTypeId('color');		

		// create makers from database
		<?php
		
		// get all events
		$db = Database::get('default');
		$obj = new Demomap($db); 
		$locations = $obj->getAllEventsGroupedByGeolocation();
		
		// create marker array	
		$markers = array();
		$latlnglist = array();
		
		foreach ($locations as $location) {

			$lat = $location['lat'];
			$lng = $location['lng'];
			$city = $location['city'];
			$country = $location['country'];
			$events = $location['events'];
			
			$content = array($lat,$lng,$city,$country,$events);
			array_push($markers,$content);
			
			$latlnglistitem = 'new google.maps.LatLng ('.$lat.','.$lng.')';
			array_push($latlnglist,$latlnglistitem);
		}
		
		$markers = json_encode($markers);
		?>
		
		var locations = <?php echo $markers; ?>;
		setMarkers(map,locations);

		var LatLngList = new Array (<?php echo implode(',', $latlnglist); ?>);
		var bounds = new google.maps.LatLngBounds ();
		for (var i = 0, LtLgLen = LatLngList.length; i < LtLgLen; i++) {
			bounds.extend (LatLngList[i]);
		}
		map.fitBounds (bounds);
	}
	
	// call google maps init function
	google.maps.event.addDomListener(window, 'load', initializeGoogleMaps);
	</script>
</head>
<body>

<div id="overlay">
	<div class="click panel">
		<div class="front"></div>
		<div class="back"></div>
	</div>
</div>
<div id="cache"></div>
<div id="canvas"></div>
<div id="sidebar"></div>
</body>
</html>