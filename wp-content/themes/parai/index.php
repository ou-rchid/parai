<?php
/**
 * The main template file. The file for the home page OR the Mapping page in our case.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package WordPress
 * @subpackage Twenty_Twenty_One
 * @since Twenty Twenty-One 1.0
 */
?>

<?php get_header(); ?>



<?php
    //In this file we want to show the "articles post type" in map (e.g., zillow)
    // How to query a custom post types: https://developer.wordpress.org/plugins/post-types/working-with-custom-post-types/

    $loop = new WP_Query(
        array(
            'post_type'  => 'articles',
        )
    );

    while ( $loop->have_posts() ) { 
        $loop->the_post();    
        // print_r($loop); //check available data in this loop

        $location = get_post_meta( get_the_ID(), 'location_hardcoded', true );
        print_r($location);

    }
?>




<div id="map"></div>

<script>
    // This example displays a marker at the center of Australia.
    // When the user clicks the marker, an info window opens.
    function initMap() {
    const uluru = { lat: -25.363, lng: 131.044 }; //This Lat Long is hardcoded. Your Task is to get the Lat Long of each "Article" dynamically and show them in the map.
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 4,
        center: uluru,
    });
    const contentString =
        '<div id="content">' +
        '<div id="siteNotice">' +
        "</div>" +
        '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
        '<div id="bodyContent">' +
        "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " +
        "sandstone rock formation in the southern part of the " +
        "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
        "south west of the nearest large town, Alice Springs; 450&#160;km " +
        "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " +
        "features of the Uluru - Kata Tjuta National Park. Uluru is " +
        "sacred to the Pitjantjatjara and Yankunytjatjara, the " +
        "Aboriginal people of the area. It has many springs, waterholes, " +
        "rock caves and ancient paintings. Uluru is listed as a World " +
        "Heritage Site.</p>" +
        '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
        "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
        "(last visited June 22, 2009).</p>" +
        "</div>" +
        "</div>";
    const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: "Uluru",
    });
    const marker = new google.maps.Marker({
        position: uluru,
        map,
        title: "Uluru (Ayers Rock)",
    });

    marker.addListener("click", () => {
        infowindow.open({
        anchor: marker,
        map,
        });
    });
    }

    window.initMap = initMap;

</script>

<?php get_footer(); ?>
