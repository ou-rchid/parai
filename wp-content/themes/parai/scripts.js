function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 20.5937, lng: 78.9629 }, // Center map on India
        zoom: 5 // Set the initial zoom level
    });

    // Array to store article locations and markers
    const locations = JSON.parse(document.getElementById('map-data').textContent);

    // Create markers for each location
    locations.forEach(function(location) {
        const marker = new google.maps.Marker({
            position: { lat: parseFloat(location.lat), lng: parseFloat(location.lng) },
            map: map,
            title: location.title
        });

        // Create info window for the marker
        const infoWindowContent = `
            <div>
                <img src="${location.thumbnail}" style="max-width: 100%; height: auto; border-radius: 5px;">
                <h4>${location.title}</h4>
                <p>${location.description}</p>
                <a href="${location.link}">Read more</a>
            </div>
        `;
        const infoWindow = new google.maps.InfoWindow({
            content: infoWindowContent
        });

        
        // Open info window when marker is clicked
        marker.addListener('click', function() {
            infoWindow.open(map, marker);
        });
    });
}
