<?php

include_once( 'cpt_articles.php' );

function add_style_script()
{
    wp_enqueue_style( 'bootstrap-css', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css');
    wp_enqueue_style( 'parai_style', get_stylesheet_uri(). '/style.css' );
    wp_enqueue_script( 'bootstrap-js', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js', array('jquery'), null, true );
    wp_enqueue_script( 'google-maps', 'https://maps.googleapis.com/maps/api/js?key=AIzaSyArnt3ViMArXWQbx7ox0-ShJ7qir2Dleog&callback=initMap', array(), null, true );
    wp_enqueue_script( 'parai_script', get_template_directory_uri() . '/scripts.js', array('jquery'), null, true );
}
add_action( 'wp_enqueue_scripts', 'add_style_script');


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






// Custom post type function
function register_articles_post_type() {
    $labels = array(
        'name'                => _x( 'Articles', 'Post Type General Name', 'parai' ),
        'singular_name'       => _x( 'Article', 'Post Type Singular Name', 'parai' ),
        'menu_name'           => __( 'Articles', 'parai' ),
        'parent_item_colon'   => __( 'Parent Article', 'parai' ),
        'all_items'           => __( 'All Articles', 'parai' ),
        'view_item'           => __( 'View Article', 'parai' ),
        'add_new_item'        => __( 'Add New Article', 'parai' ),
        'add_new'             => __( 'Add New', 'parai' ),
        'edit_item'           => __( 'Edit Article', 'parai' ),
        'update_item'         => __( 'Update Article', 'parai' ),
        'search_items'        => __( 'Search Article', 'parai' ),
        'not_found'           => __( 'Not Found', 'parai' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'parai' ),
    );

    $args = array(
        'label'               => __( 'Articles', 'parai' ),
        'description'         => __( 'Article news and reviews', 'parai' ),
        'labels'              => $labels,
        'supports'            => array( 'title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'),
        'taxonomies'          => array( 'category', 'post_tag' ),
        'hierarchical'        => true,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 5,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
        'show_in_rest'        => true,
    );

    register_post_type( 'articles', $args );
}
add_action( 'init', 'register_articles_post_type' );

?>