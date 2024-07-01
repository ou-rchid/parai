// Pass PHP array to JavaScript
// var locations = <?php echo json_encode($locations); ?>;
console.log("check!");
// Initialize Google Map
function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 20.5937, lng: 78.9629 }, // Center map on India
        zoom: 5 // Set the initial zoom level
    });

    // Add markers to the map
    locations.forEach(function(location) {
        const marker = new google.maps.Marker({
            position: { lat: parseFloat(location.lat), lng: parseFloat(location.lng) },
            map: map,
            title: location.title
        });

        // Define the content of the info window
        const infoWindowContent = `
            <div>
                <img src="${location.thumbnail}" style="max-width: 100%; height: auto; border-radius: 5px;">
                <h4>${location.title}</h4>
                <p>${location.description}</p>
                <a href="#" class="read-more" data-title="${location.title}" data-description="${location.description}" data-images="${location.images}" data-videos="${location.videos}" data-link="${location.link}">Read more</a>
            </div>
        `;
        const infoWindow = new google.maps.InfoWindow({
            content: infoWindowContent
        });

        // Open the info window when the marker is clicked
        marker.addListener('click', function() {
            infoWindow.open(map, marker);
        });
    });
}

// Event listener for "Read more" links to open the modal with detailed info
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('read-more')) {
        e.preventDefault();

        const title = e.target.getAttribute('data-title');
        const description = e.target.getAttribute('data-description');
        const images = e.target.getAttribute('data-images').split(',');
        const videos = e.target.getAttribute('data-videos').split(',');
        const link = e.target.getAttribute('data-link');

        document.getElementById('modal-title').textContent = title;
        document.getElementById('modal-description').textContent = description;
        document.getElementById('modal-link').setAttribute('href', link);

        let modalHTML = '';
        images.forEach(image => {
            modalHTML += '<div class="grid-item"><img src="' + image + '" alt="Image" class="modal-image"></div>';
        });
        videos.forEach(video => {
            modalHTML += '<div class="grid-item"><video controls class="modal-video"><source src="' + video + '" type="video/mp4"></video></div>';
        });

        const modalMedia = document.getElementById('modal-media');
        modalMedia.innerHTML = modalHTML;

        const modal = document.getElementById('myModal');
        modal.style.display = 'block';
    }
});

// Event listeners to close the modal
const closeBtns = document.querySelectorAll('.close');
closeBtns.forEach(btn => {
    btn.addEventListener('click', function() {
        const modal = document.getElementById('myModal');
        modal.style.display = 'none';
    });
});

// Close the modal when clicking outside of it
window.addEventListener('click', function(e) {
    const modal = document.getElementById('myModal');
    if (e.target === modal) {
        modal.style.display = 'none';
    }
});
