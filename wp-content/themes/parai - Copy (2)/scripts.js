
function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 20.5937, lng: 78.9629 }, // Center map on India
        zoom: 5 // Set the initial zoom level
    });

    // Array to store article locations and markers
    const locations = [
        { lat: 13.799306828552597, lng: 77.4906449858703, title: 'Article 1' },
        // Add more locations for other articles
    ];

    // Create markers for each location
    locations.forEach(function(location) {
        const marker = new google.maps.Marker({
            position: { lat: location.lat, lng: location.lng },
            map: map,
            title: location.title
        });

        // Create info window for the marker
        const infoWindow = new google.maps.InfoWindow({
            content: `<h4>${location.title}</h4>`
        });

        // Open info window when marker is clicked
        marker.addListener('click', function() {
            infoWindow.open(map, marker);
        });
    });
}
