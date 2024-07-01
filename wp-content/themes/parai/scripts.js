
// console.log(article_locations); // article_locations is declared in index.php

async function initMap() {
    // Request needed libraries.
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
    const map = new Map(document.getElementById("map"), {
        center: { lat: 13.036218781849394, lng: 77.69639402182948 }, // Center map on India
        zoom: 7,
        mapId: "4504f8b37365c3d0",
    });



    for (const article_location of article_locations) {

        // Add marker to the map
        const AdvancedMarkerElement = new google.maps.marker.AdvancedMarkerElement({
            position: { lat: parseFloat(article_location.lat), lng: parseFloat(article_location.lng) },
            map: map,
            title: article_location.title
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
        AdvancedMarkerElement.addListener('click', function () {
            infoWindow.open(map, AdvancedMarkerElement);
        });

    };


}

initMap();





