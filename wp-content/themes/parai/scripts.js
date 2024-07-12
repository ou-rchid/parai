// Define an asynchronous function to initialize the map
async function initMap() {
    // Load the necessary libraries from the Google Maps API using the importLibrary method
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement, PinElement, Polyline } = await google.maps.importLibrary("marker", "polyline");
    // const { Place } = await google.maps.importLibrary("places");


    // Create a new map centered on a specific location (India) with a specified zoom level and map ID
    const map = new Map(document.getElementById("map"), {
        center: { lat: 11.44129895546545, lng: 77.72918352501114 },
        zoom: 8,
        mapId: "4504f8b37365c3d0",
    });

    // Variable to keep track of the currently open info window
    let openInfoWindow = null;

    // Array to store markers
    const markers = [];


    // Function to create a pin element
    const createPinElement = (glyphColor) => {
        return new google.maps.marker.PinElement({ glyphColor }).element;
    };

    // Function to create an info window
    const createInfoWindow = (content) => {
        return new google.maps.InfoWindow({ content });
    };

    // Function to add marker event listeners
    const addMarkerListeners = (marker, infoWindow) => {
        marker.addListener('click', () => {
            if (openInfoWindow) openInfoWindow.close();
            infoWindow.open(map, marker);
            openInfoWindow = infoWindow;
        });
    };




    // Function to handle sidebar item mouse events
    const handleSidebarItemMouseEvents = (item, sidebarItem, marker) => {
        sidebarItem.addEventListener('mouseover', () => {
            if (openInfoWindow) openInfoWindow.close();
            marker.content = createPinElement("#ffffff");
            addMarkerListeners(marker, createInfoWindow(generateInfoWindowContent(item)));
        });

        sidebarItem.addEventListener('mouseout', () => {
            marker.content = createPinElement("#B31412");
            addMarkerListeners(marker, createInfoWindow(generateInfoWindowContent(item)));
        });
    };

    // Function to generate info window content
    const generateInfoWindowContent = (item) => {
        return `
            <div class="card m-0 p-0 border-0 article_popup ${item.id}">
                <a href="${item.link}">
                    <img src="${item.thumbnail}" class="">
                </a>
                <div class="card-body p-2">
                    <a href="${item.link}"><h6 class="">${item.title}</h6></a>
                <p class="m-0 small">Posted on: ${item.date}</p>
                </div>
            </div>
        `;
    };


    // Function to generate info window content
    const generateSidebarContent = (item) => {
        return `
        <div class="card ${item.id}">
            <a href="${item.link}">
                <img src="${item.thumbnail}" class="card-img-top">
            </a>
            <div class="card-body p-2">
                <a href="${item.link}"><h6 class="">${item.title}</h6></a>
                <p class="m-0 small">Posted on: ${item.date}</p>
            </div>
            
        </div>
    `;
    };


    // Loop through an array of article locations to place markers on the map
    article_locations.forEach((item, index) => {
        const marker = new google.maps.marker.AdvancedMarkerElement({
            position: { lat: parseFloat(item.lat), lng: parseFloat(item.lng) },
            map: map,
            title: item.title,
            content: createPinElement("#B31412"),
        });

        markers.push(marker);

        const infoWindowContent = generateInfoWindowContent(item);
        const infoWindow = createInfoWindow(infoWindowContent);

        addMarkerListeners(marker, infoWindow);

        // SIDEBAR
        const sidebarItem = document.createElement('div');
        sidebarItem.className = 'item mb-3';

        sidebarItemContent = generateSidebarContent(item);
        sidebarItem.innerHTML = sidebarItemContent;

        document.getElementById('sidebar').appendChild(sidebarItem);

        handleSidebarItemMouseEvents(item, sidebarItem, marker);

        console.log("Item:", item);


        // POLYLINES
        let triangleCoords = [];
        try {
            triangleCoords = JSON.parse(item.polyline);
        } catch (error) {
            console.error(`Error parsing polyline for item ${index}:`, error);
            return; // Skip further processing if parsing fails
        }

        // Verify triangleCoords is an array
        if (!Array.isArray(triangleCoords)) {
            console.error(`Invalid polyline format for item ${index}`);
            return; // Skip further processing if polyline format is invalid
        }

        // Construct the polygon.
        const polyline = new google.maps.Polygon({
            paths: triangleCoords,
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 3,
            fillColor: "#FF0000",
            fillOpacity: 0.35,
        });

        polyline.setMap(map);


    });

    // Add event listener to close info window when clicking outside of it
    map.addListener('click', () => {
        if (openInfoWindow) {
            openInfoWindow.close();
            openInfoWindow = null;
        }
    });



}

initMap();


