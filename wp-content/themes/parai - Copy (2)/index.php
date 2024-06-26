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
        }

        #map {
            width: 100%;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
        }

        .article-cards {
            width: 50%;
            max-height: 100vh;
            overflow-y: auto;
            padding: 20px;
            box-sizing: border-box;
            background-color: #f9f9f9;
            margin-left: 50%;
        }

        .article-card {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .featured-image img {
            width: 100%;
            height: auto;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .article-details {
            padding: 10px;
        }

        h2 {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .article-coordinate {
            color: #777;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <?php
        $args = array(
            'post_type'      => 'articles',
            'posts_per_page' => -1
        );
        $articles = new WP_Query($args);
        $current_article = get_query_var('articles');
        $current_url = get_permalink(get_the_ID());
        $found = false;

        $locations = array(); // Array to store location data

        if ($articles->have_posts()) :
    ?>
        <div id="map"></div>
        <div class="article-cards">
            <?php
                while ($articles->have_posts()) : 
                $articles->the_post();
                $meta = get_post_meta(get_the_ID(), 'parai_location', true);
                $lat_lng = explode(',', $meta);
                $lat = isset($lat_lng[0]) ? trim($lat_lng[0]) : '';
                $lng = isset($lat_lng[1]) ? trim($lat_lng[1]) : '';
                $lnk = get_permalink(get_the_ID());
                $thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'thumbnail');

                // Add location data to the array
                if ($lat && $lng) {
                    $locations[] = array(
                        'lat' => $lat,
                        'lng' => $lng,
                        'title' => get_the_title(),
                        'link' => $lnk,
                        'thumbnail' => $thumbnail
                    );
                }
            ?>
                <?php if ($lat && $lng) : ?>
                    <div class="article-card">
                        <div class="featured-image">
                            <img src="<?php echo $thumbnail; ?>" alt="<?php the_title(); ?>">
                        </div>
                        <div class="article-details">
                            <h2><?php the_title(); ?></h2>
                            <div class="article-coordinate">
                                Latitude: <?php echo $lat; ?>, Longitude: <?php echo $lng; ?>
                            </div>
                            <a href="<?php echo $lnk; ?>">Read more</a>
                        </div>
                    </div>
                <?php endif; ?>
            <?php
                endwhile;
            ?>
        </div>
    <?php
        endif;
        wp_reset_postdata();
    ?>

    <script>
        // Convert PHP array to JavaScript array
        var locations = <?php echo json_encode($locations); ?>;

        function initMap() {
            const map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 20.5937, lng: 78.9629 }, // Center map on India
                zoom: 5 // Set the initial zoom level
            });

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
    </script>

    <!-- Replace 'YOUR_API_KEY' with your actual API key -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArnt3ViMArXWQbx7ox0-ShJ7qir2Dleog&callback=initMap" async defer></script>
</body>
</html>
