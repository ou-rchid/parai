async function initMap() {
    const { Map, InfoWindow, Marker, marker } = await google.maps.importLibrary(["maps", "infowindow", "marker"]);

    const map = new Map(document.getElementById("map"), {
        center: { lat: 13.036218781849394, lng: 77.69639402182948 },
        zoom: 7,
        mapId: "4504f8b37365c3d0",
    });

    let openInfoWindow = null;
    const markers = [];

    article_locations.forEach((item, index) => {
        const pin = new marker.PinElement({
            scale: 1.25,
            background: "#000",
        });

        const markerOptions = {
            position: { lat: parseFloat(item.lat), lng: parseFloat(item.lng) },
            map: map,
            title: item.title,
            content: pin.element,
        };

        const marker = new marker.AdvancedMarkerElement(markerOptions);
        markers.push(marker);

        const infoWindowContent = `
            <div class="article_popup ${item.id}">
                <a href="${item.link}">
                    <img src="${item.thumbnail}" style="">
                    <h4>${item.title}</h4>
                </a>
            </div>
        `;

        const infoWindow = new InfoWindow({
            content: infoWindowContent
        });

        marker.addListener('click', () => {
            if (openInfoWindow) {
                openInfoWindow.close();
            }
            infoWindow.open(map, marker);
            openInfoWindow = infoWindow;
        });

        const sidebarItem = document.createElement('div');
        sidebarItem.className = 'item';
        sidebarItem.innerHTML = infoWindowContent;
        document.getElementById('sidebar').appendChild(sidebarItem);

        sidebarItem.addEventListener('mouseover', () => {
            marker.setOptions({ content: new marker.PinElement({ scale: 1.25, background: "#ccc" }).element });
        });

        sidebarItem.addEventListener('mouseout', () => {
            marker.setOptions({ content: new marker.PinElement({ scale: 1.25, background: "#000" }).element });
        });
    });
}

initMap();




console.log(article_locations); 
// article_locations is declared in index.php




// Define an asynchronous function to initialize the map
async function initMap() {
    // Load the necessary libraries from the Google Maps API using the importLibrary method
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement, PinElement } = await google.maps.importLibrary("marker");

    // const { Places } = await google.maps.importLibrary("places");


    // Create a new map centered on a specific location (India) with a specified zoom level and map ID

    const map = new Map(document.getElementById("map"), {
        center: { lat: 13.036218781849394, lng: 77.69639402182948 },
        zoom: 7,
        mapId: "4504f8b37365c3d0",
    });

    // Variable to keep track of the currently open info window
    let openInfoWindow = null;

    // Array to store markers
    const markers = [];

    // Loop through an array of article locations to place markers on the map
    article_locations.forEach((item, index) => {

        console.log("HERE IS THE INDEX:" + index);

        let pin = new google.maps.marker.PinElement({
            scale: 1.25,
            background: "#000",
        });
        // Create a new marker for each article location with its position, map, and title
        const marker = new google.maps.marker.AdvancedMarkerElement({
            position: { lat: parseFloat(item.lat), lng: parseFloat(item.lng) },
            map: map,
            title: item.title,
            content: pin.element,
        });

        // Store the marker in the array [might be needed in the future (e.g., to sort and filter?)]
        markers.push(marker);

        // Define the content of the info window that will appear when the marker is clicked
        const infoWindowContent = `
            <div class="article_popup ${item.id}">
                <a href="${item.link}">
                    <img src="${item.thumbnail}" style="">
                    <h4>${item.title}</h4>
                </a>
            </div>
        `;

        // Create a new info window with the defined content
        const infoWindow = new google.maps.InfoWindow({
            content: infoWindowContent
        });

        // Add a click event listener to the marker
        marker.addListener('click', () => {
            // Close the currently open info window if there is one
            if (openInfoWindow) {
                openInfoWindow.close();
            }
            // Open the new info window
            infoWindow.open(map, marker);
            // Set the open info window to the current one
            openInfoWindow = infoWindow;
        });


        // SIDEBAR
        // Create a sidebar item for each JSON item
        const sidebarItem = document.createElement('div');
        sidebarItem.className = 'item';
        sidebarItem.innerHTML = infoWindowContent;

        // Append the sidebar item to the sidebar container
        document.getElementById('sidebar').appendChild(sidebarItem);

        // Add mouseover event listener to animate the marker
        sidebarItem.addEventListener('mouseover', () => {

            if (openInfoWindow) {
                openInfoWindow.close();
            }

            let pin = new google.maps.marker.PinElement({
                scale: 1.25,
                background: "#ccc",
            });
            // Create a new marker for each article location with its position, map, and title
            // Change pin background color to gray on mouseover
            const grayPin = new google.maps.marker.PinElement({
                scale: 1.25,
                background: "#ccc",
            });

            // Update marker content with modified pin element
            const marker = new google.maps.marker.AdvancedMarkerElement({
                position: { lat: parseFloat(item.lat), lng: parseFloat(item.lng) },
                map: map,
                title: item.title,
                content: pin.element,
            });

            // Add a click event listener to the marker
            marker.addListener('click', () => {
                // Close the currently open info window if there is one
                if (openInfoWindow) {
                    openInfoWindow.close();
                }
                // Open the new info window
                infoWindow.open(map, marker);
                // Set the open info window to the current one
                openInfoWindow = infoWindow;
            });


        });

        // Add mouseout event listener to stop the animation
        sidebarItem.addEventListener('mouseout', () => {
            let pin = new google.maps.marker.PinElement({
                scale: 1.25,
                background: "#000",
            });
            // Create a new marker for each article location with its position, map, and title
            const marker = new google.maps.marker.AdvancedMarkerElement({
                position: { lat: parseFloat(item.lat), lng: parseFloat(item.lng) },
                map: map,
                title: item.title,
                content: pin.element,
            });

            // Add a click event listener to the marker
            marker.addListener('click', () => {
                // Close the currently open info window if there is one
                if (openInfoWindow) {
                    openInfoWindow.close();
                }
                // Open the new info window
                infoWindow.open(map, marker);
                // Set the open info window to the current one
                openInfoWindow = infoWindow;
            });

        });



    })
}



initMap();

// marker.setContent


