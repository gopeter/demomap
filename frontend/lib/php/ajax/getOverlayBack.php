<?php

// include required classes
require_once('../database.class.php');
require_once('../demomap.class.php');

$id = $_POST['id'];
$name = $_POST['name'];

$db = Database::get('default');
$obj = new Demomap($db); 
$effects = $obj->getEffectsByDemo($id);

$content = '<a href="#" class="close-demo-details">zurück</a>';
$content .= '<h2>' . $name . '</h2>';

if ($effects) {
	$content .= '<table border="0" cellspacing="0" cellpadding="0">';
	$content .= '<tr><th>Effekt</th><th>Beschreibung</th><th>Zeitraum</th><th>Screenshot</th></tr>';
	
	foreach ($effects as $effect) {
	
		$effect_tags = $effect['effect_ids'];
		$effect_tags = str_replace(' ', '', $effect_tags);
		$effect_tags = explode(',', $effect_tags);
	
		$content .= '<tr>';
		$content .= '<td>';
		
			$effect_tag_name_array = array();
			foreach ($effect_tags as $effect_tag) {
				$effect_tag_name = $obj->getEffectTagByID($effect_tag);
				array_push($effect_tag_name_array, $effect_tag_name['name']);
			}
			$content .= implode(', ', $effect_tag_name_array);
		$content .= '</td>';
		$content .= '<td>' . $effect['description'] . '</td>';
		$content .= '<td>' . $effect['timespace'] . '</td>';		
		
		if ($effect['screenshot']) {
			$imgurl = 'http://gopeter.de/clients/fh/demomap/content/screenshots/'.$id.'/'.$effect['screenshot'];
			$size = getimagesize($imgurl);
			$height = (180 * $size[1]) / $size[0];
			$img = '<img src="'.$imgurl.'" width="180" height="'.$height.'" />'; 
			$screen = $img;
		} else {
			$screen = '-';
		}
			
		$content .= '<td width="180">' . $screen . '</td>';				
		$content .= '</tr>';
	}
	
	$content .= '</table>';
	
} else {
	$content .= '<p>Keine Details vorhanden</p>';
}

echo $content;

?>