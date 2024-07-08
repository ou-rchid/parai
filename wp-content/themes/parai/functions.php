<?php

function add_style_script()
{
    wp_enqueue_style( 'bootstrap-css', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css');
    wp_enqueue_style( 'parai_style', get_stylesheet_uri() );
    
    // wp_enqueue_script('googlemaps', 'https://maps.googleapis.com/maps/api/js?key=AIzaSyB8UQmEqkj9DZ4hP5H_cGyGpPYtMtIpIQQ&loading=async&libraries=maps,marker,places&v=weekly', array(), '', true); // ADD API key once you get it from Zoe    

    wp_enqueue_script( 'bootstrap-js', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js', array('jquery'), null, true );
    wp_enqueue_script( 'parai_script', get_template_directory_uri() . '/scripts.js', array('jquery'), null, true );
}
add_action( 'wp_enqueue_scripts', 'add_style_script');


/**
 * We will be using Google MAP AI to map the "articles"  
 * The function below is to make the API accessible in WP-Admin.
 */
function pw_google_api_key() {
	return ''; //Insert the API key within ''. Ask Zoe to provide API key.See how to get an API key at: https://developers.google.com/maps/documentation/javascript/get-api-key
}
add_filter( 'pw_google_api_key', 'pw_google_api_key' );



// Register navigation
register_nav_menus(
    array(
        'primary-menu' => __('Primary Menu'),
        'secondary-menu' => __('Secondary Menu')
    )
);

// Add support for wide alignment
add_theme_support( 'align-wide' );
// Activate featured images
add_theme_support( 'post-thumbnails' );
// Add support for responsive embeds
add_theme_support( 'responsive-embeds' );
// Add support for selective refresh for widgets
add_theme_support( 'customize-selective-refresh-widgets' );
// Add support for post formats
add_theme_support( 'post-formats', array( 'video', 'audio', 'gallery', 'aside' ) );



//// Adding Custom post type called Articles. This custom post type will represent each Parai/Music post containing,text,image,video in the map
require get_template_directory().'/cpt_articles.php';


//add additional image sizes
add_action( 'after_setup_theme', 'wpdocs_theme_setup' );
function wpdocs_theme_setup() {
	// add_image_size( 'category-thumb', 300 ); // 300 pixels wide (and unlimited height)
	add_image_size( 'homepage-thumb', 300, 169, true ); // (cropped)
}


?>








