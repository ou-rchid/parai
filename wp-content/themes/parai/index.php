<!DOCTYPE html>
<html>
<head>
    <title>Article Map and Cards</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f2f2f2;
        }

        h1 {
            margin-bottom: 20px;
        }

        .container {
            position: relative;
            width: calc(100% - 5px);
            max-width: 800px;
            height: calc(100% - 10px);
            max-height: 600px;
            border: 1px solid #ccc;
            overflow: hidden;
            background-color: white;
        }

        #map {
            width: 100%;
            height: 100%;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 90%;
            height: 90%;
            max-width: 1000px;
            max-height: 700px;
            overflow-y: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .grid-item {
            background-color: #f9f9f9;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .grid-item img,
        .grid-item video {
            width: 100%;
            height: auto;
            display: block;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .modal-header h2 {
            margin: 0;
        }

        .modal-body {
            max-height: 500px;
            overflow-y: auto;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            padding-top: 20px;
        }

        .modal-footer a {
            padding: 10px 20px;
            background-color: #0073aa;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .modal-footer a:hover {
            background-color: #005f8d;
        }
    </style>
</head>
<body>
    <h1>Parai Map</h1>
    <div class="container">
        <div id="map"></div>
    </div>
    <div id="myModal" class="modal">
        <span class="close">&times;</span>
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modal-title"></h2>
                <span class="close">&times;</span>
            </div>
            <div class="modal-body">
                <p id="modal-description"></p>
                <div class="grid-container" id="modal-media"></div>
            </div>
            <div class="modal-footer">
                <a href="#" id="modal-link">Read More</a>
            </div>
        </div>
    </div>

    <?php
        $args = array(
            'post_type' => 'articles',
            'posts_per_page' => -1
        );
        $articles = new WP_Query($args);

        $locations = array(); // Array to store location data

        if ($articles->have_posts()) :
            while ($articles->have_posts()) :
                $articles->the_post();
                $meta = get_post_meta(get_the_ID(), 'parai_location', true);
                $lat_lng = explode(',', $meta);
                $lat = isset($lat_lng[0]) ? trim($lat_lng[0]) : '';
                $lng = isset($lat_lng[1]) ? trim($lat_lng[1]) : '';
                $lnk = get_permalink(get_the_ID());
                $thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'thumbnail');
                $description = get_the_excerpt();

                // Get image URLs
                $images = array();
                $image_attachments = get_attached_media('image', get_the_ID());
                foreach ($image_attachments as $image) {
                    $images[] = wp_get_attachment_url($image->ID);
                }

                // Get video URLs
                $videos = array();
                $video_attachments = get_attached_media('video', get_the_ID());
                foreach ($video_attachments as $video) {
                    $videos[] = wp_get_attachment_url($video->ID);
                }

                // Add location data to the array
                if ($lat && $lng) {
                    $locations[] = array(
                        'lat' => $lat,
                        'lng' => $lng,
                        'title' => get_the_title(),
                        'link' => $lnk,
                        'thumbnail' => $thumbnail,
                        'description' => $description,
                        'images' => implode(',', $images), // comma-separated list of image URLs
                        'videos' => implode(',', $videos)  // comma-separated list of video URLs
                    );
                }
            endwhile;
        endif;
        wp_reset_postdata();
    ?>

    <script>
        var locations = <?php echo json_encode($locations); ?>;

        function initMap() {
            const map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 20.5937, lng: 78.9629 }, // Center map on India
                zoom: 5 // Set the initial zoom level
            });

            locations.forEach(function(location) {
                const marker = new google.maps.Marker({
                    position: { lat: parseFloat(location.lat), lng: parseFloat(location.lng) },
                    map: map,
                    title: location.title
                });

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

                marker.addListener('click', function() {
                    infoWindow.open(map, marker);
                });
            });
        }

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

        const closeBtns = document.querySelectorAll('.close');
        closeBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const modal = document.getElementById('myModal');
                modal.style.display = 'none';
            });
        });

        window.addEventListener('click', function(e) {
            const modal = document.getElementById('myModal');
            if (e.target === modal) {
                modal.style.display = 'none';
            }
        });
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArnt3ViMArXWQbx7ox0-ShJ7qir2Dleog&callback=initMap" async defer></script>
</body>
</html>
