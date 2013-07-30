var markerIds = [];
var markers = [];

// add marker function
function setMarkers(map,locations) {

	for (var i = 0; i < locations.length; i++) {  
		var lat = locations[i][0];
		var lng = locations[i][1];
		var city = locations[i][2];
		var country = locations[i][3];
		var events = locations[i][4];
		var latlngset = new google.maps.LatLng(lat, lng);
		var width = 40 * events.length * 0.6;
		var height = 40 * events.length * 0.6;

		var pinIcon = new google.maps.MarkerImage(
		    'lib/img/marker.svg',
		    null, /* size is determined at runtime */
		    null, /* origin is 0,0 */
		    null, /* anchor is bottom center of the scaled image */
		    new google.maps.Size(width, height)
		); 	
		
		var content = (events.length == 1) ? events.length + ' Event' : events.length + ' Events';
		
		var marker = new MarkerWithLabel({
			position: latlngset,
			draggable: false,
			map: map,
			lat:lat,
			lng:lng,
			icon: pinIcon,
			labelContent: content,
			labelAnchor: new google.maps.Point(30, 0),
			labelClass: 'labels',
		});
		
		google.maps.event.addListener(marker, 'click', function () {
			$.ajax({
				type: 'POST',			
				url: '/clients/fh/demomap/lib/php/ajax/getOverlayFront.php',
				data: {lat:this.lat,lng:this.lng},
				success:function(response){
					$('#overlay .front').html(response);
					$('#overlay').fadeIn();
				}
			});
        });
	}
}

$(function(){
	$(document).on('click', '.close-overlay', function() {
		$('#overlay').fadeOut();
		return false;
	});
	
	$(document).on('click', '.open-demo-details', function(){
		var panel = $('.panel');
		var id = $(this).data('demo-id');
		var name = $(this).data('demo-name'); 
		$.ajax({
			type: 'POST',			
			url: '/clients/fh/demomap/lib/php/ajax/getOverlayBack.php',
			data: {id:id,name:name},
			success:function(response){
				console.log(response);
				panel.addClass('flip');
				$('#overlay .back').html(response);
			}
		});		
		return false;
	});
	
	$(document).on('click', '.close-demo-details', function(){
		var panel = $('.panel');
		panel.removeClass('flip');
		return false;
	});	
				
});
