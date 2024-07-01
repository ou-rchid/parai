
// console.log(article_locations); 
// article_locations is declared in index.php

async function initMap() {
    // Request needed libraries.
    const { Map, InfoWindow } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");
    const map = new Map(document.getElementById("map"), {
        center: { lat: 13.036218781849394, lng: 77.69639402182948 }, // Center map on India
        zoom: 7,
        mapId: "4504f8b37365c3d0",
    });

    let openInfoWindow = null;  // Keep track of the currently open info window

    for (const article_location of article_locations) {

        // Add marker to the map
        const marker = new google.maps.marker.AdvancedMarkerElement({
            position: { lat: parseFloat(article_location.lat), lng: parseFloat(article_location.lng) },
            map: map,
            title: article_location.title,

        });

        // Define the content of the info window
        const infoWindowContent = `
            <div class="article_popup">
                <a href="${article_location.link}">
                    <img src="${article_location.thumbnail}" style="">
                    <h4>${article_location.title}</h4>
                </a>
            </div>
        `;

        // add the content to the info window
        const infoWindow = new google.maps.InfoWindow({
            content: infoWindowContent
        });

        // Open the info window when the marker is clicked        
        marker.addListener('click', function () {
            // Close the currently open info window if there is one
            if (openInfoWindow) {
                openInfoWindow.close();
            }
            // Open the new info window
            infoWindow.open(map, marker);
            // Set the open info window to the current one
            openInfoWindow = infoWindow;
        });
    };

}

initMap();





