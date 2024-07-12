(function () {
	'use strict';

	var maps = [];

	var mapElements = document.querySelectorAll('.cmb-type-pw-map');
	mapElements.forEach(function (mapElement) {
		initializeMap(mapElement);
	});

	function initializeMap(mapInstance) {
		var searchInput = mapInstance.querySelector('.pw-map-search');
		var mapCanvas = mapInstance.querySelector('.pw-map');
		var latitude = mapInstance.querySelector('.pw-map-latitude');
		var longitude = mapInstance.querySelector('.pw-map-longitude');
		var polylineInput = mapInstance.querySelector('.pw-map-polyline'); // Hidden input field for polyline coordinates
		var latLng = new google.maps.LatLng(9.925950845549632, 78.11835982401956);
		var zoom = 5;

		// If we have saved values, let's set the position and zoom level
		if (latitude.value.length > 0 && longitude.value.length > 0) {
			latLng = new google.maps.LatLng(parseFloat(latitude.value), parseFloat(longitude.value));
			zoom = 17;
		}

		// Map
		var mapOptions = {
			center: latLng,
			zoom: zoom
		};
		var map = new google.maps.Map(mapCanvas, mapOptions);

		// Marker
		var markerOptions = {
			map: map,
			draggable: true,
			title: 'Drag to set the exact location'
		};
		var marker = new google.maps.Marker(markerOptions);

		if (latitude.value.length > 0 && longitude.value.length > 0) {
			marker.setPosition(latLng);
		}

		// Search
		var autocomplete = new google.maps.places.Autocomplete(searchInput);
		autocomplete.bindTo('bounds', map);

		google.maps.event.addListener(autocomplete, 'place_changed', function () {
			var place = autocomplete.getPlace();
			if (!place.geometry) {
				return;
			}

			if (place.geometry.viewport) {
				map.fitBounds(place.geometry.viewport);
			} else {
				map.setCenter(place.geometry.location);
				map.setZoom(17);
			}

			marker.setPosition(place.geometry.location);

			latitude.value = place.geometry.location.lat();
			longitude.value = place.geometry.location.lng();
		});

		searchInput.addEventListener('keypress', function (event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});

		// Allow marker to be repositioned
		google.maps.event.addListener(marker, 'drag', function () {
			latitude.value = marker.getPosition().lat();
			longitude.value = marker.getPosition().lng();

			// Update polyline and hidden input field
			updatePolyline();
		});

		// Polyline drawing functionality
		var polyLineCoordinates = [];

		// If there are saved polyline coordinates, parse and set them
		if (polylineInput.value.length > 0) {
			var savedCoordinates = JSON.parse(polylineInput.value);
			savedCoordinates.forEach(function (coord) {
				polyLineCoordinates.push(new google.maps.LatLng(coord.lat, coord.lng));
			});
		}

		var polyLine = new google.maps.Polyline({
			map: map,
			path: polyLineCoordinates,
			strokeColor: '#FF0000',
			strokeOpacity: 1.0,
			strokeWeight: 2
		});

		// Green marker for drawing
		var greenMarker = new google.maps.Marker({
			map: map,
			icon: {
				path: google.maps.SymbolPath.CIRCLE,
				scale: 8,
				fillColor: '#00FF00',
				fillOpacity: 1,
				strokeWeight: 1
			},
			draggable: false
		});

		// Set green marker to the last coordinate of the polyline if it exists
		if (polyLineCoordinates.length > 0) {
			greenMarker.setPosition(polyLineCoordinates[polyLineCoordinates.length - 1]);
		}

		google.maps.event.addListener(map, 'click', function (event) {
			addLatLng(event.latLng);
		});

		function addLatLng(latLng) {
			polyLineCoordinates.push(latLng);
			polyLine.setPath(polyLineCoordinates);

			// Update hidden input fields with new coordinates
			updatePolyline();

			// Update green marker position
			greenMarker.setPosition(latLng);
		}

		function updatePolyline() {
			var path = polyLine.getPath();
			var coordinates = path.getArray();
			var latLngArray = coordinates.map(function (coord) {
				return { lat: coord.lat(), lng: coord.lng() };
			});

			// Update hidden input field for polyline coordinates
			polylineInput.value = JSON.stringify(latLngArray);
		}

		// Clear polyline function
		function clearPolyline() {
			polyLineCoordinates = [];
			polyLine.setPath(polyLineCoordinates);
			polylineInput.value = '';
			greenMarker.setPosition(null); // Hide the green marker
		}

		// Create clear button
		var clearButton = document.createElement('button');
		clearButton.textContent = 'Clear Polyline';
		clearButton.addEventListener('click', clearPolyline);
		mapInstance.appendChild(clearButton);

		maps.push(map);
	}

	// Resize map when meta box is opened
	if (typeof postboxes !== 'undefined') {
		postboxes.pbshow = function () {
			maps.forEach(function (map) {
				var mapCenter = map.getCenter();
				google.maps.event.trigger(map, 'resize');
				map.setCenter(mapCenter);
			});
		};
	}

	// When a new row is added, reinitialize Google Maps
	var repeatableGroups = document.querySelectorAll('.cmb-repeatable-group');
	repeatableGroups.forEach(function (group) {
		group.addEventListener('cmb2_add_row', function (event) {
			var newRow = event.detail.clone;
			var groupWrap = newRow.closest('.cmb-repeatable-group');
			var mapElements = groupWrap.querySelectorAll('.cmb-type-pw-map');
			mapElements.forEach(function (mapElement) {
				initializeMap(mapElement);
			});
		});
	});
})();