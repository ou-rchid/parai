<?php 

    // Adding Custom post type called Articles. 
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
            'supports'            => array( 'title', 'editor','template', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields','post-formats'),
            // 'taxonomies'          => array( 'category', 'post_tag' ),
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



    // Adding Custom Meta Boxes to enable authors to add custom content (in addition to the default form fields available in wordpress) e.g., location.
    // We are using CMB2 plugin to do this.
    // Learn more about how to use this plugin into the project, visit: https://cmb2.io/docs/home 
    // CMB Basic Usage Link: https://github.com/CMB2/CMB2/wiki/Basic-Usage 



    //Add custom meta box
    add_action( 'cmb2_admin_init', 'location_metabox' );

    function location_metabox() {

        /**
         * Initiate the metabox
         */
        $cmb = new_cmb2_box( array(
            'id'            => 'location_metabox',
            'title'         => __( 'Location', 'cmb2' ),
            'object_types'  => array( 'articles', ), // We want to add "Location" metabox in "Articles" post type.
            'context'      => 'normal', //  'normal', 'advanced', or 'side'
            'priority'     => 'low',  //  'high', 'core', 'default' or 'low'
            'show_names'   => true, // Show field names on the left
            // 'cmb_styles' => false, // false to disable the CMB stylesheet
            // 'closed'     => true, // Keep the metabox closed by default
        ) );


        //Once we have the Google Map API key,
        //We want the authors to be able to enter the LOCATION (including Langitude and Lattitude) for the article. This will be used to list/visualize in maps api.
        //To do so we are using the cmb_field_map plugin (https://github.com/mustardBees/cmb_field_map)
        //
        $cmb->add_field( array(
            'name' => '1. Enter the Location. <br> 2. Select the addresss. <br> 3. Drag the marker to set the exact location.',
            'desc' => 'Drag the marker to set the exact location',
            'id' => 'location',
            'type' => 'pw_map',
            'split_values' => true, // Save latitude and longitude as two separate fields
        ) );
        
    }






/**
 * Add custom taxonomies
 *
 * Additional custom taxonomies can be defined here
 * https://codex.wordpress.org/Function_Reference/register_taxonomy
 */
function add_article_type_taxonomy() {
    // Add new "Locations" taxonomy to Posts
    register_taxonomy('article_type', 'articles', array(
      // Hierarchical taxonomy (like categories)
      'hierarchical' => true,
      // This array of options controls the labels displayed in the WordPress Admin UI
      'labels' => array(
        'name' => _x( 'Article Types', 'taxonomy general name' ),
        'singular_name' => _x( 'Article Type', 'taxonomy singular name' ),
        'search_items' =>  __( 'Search Article Types' ),
        'all_items' => __( 'All Article Types' ),
        'parent_item' => __( 'Parent Article Type' ),
        'parent_item_colon' => __( 'Parent Article Type:' ),
        'edit_item' => __( 'Edit Article Type' ),
        'update_item' => __( 'Update Article Type' ),
        'add_new_item' => __( 'Add New Article Type' ),
        'new_item_name' => __( 'New Article Type Name' ),
        'menu_name' => __( 'Article Types' ),
      ),
      // Control the slugs used for this taxonomy
      'rewrite' => array(
        'slug' => 'article_types', // This controls the base slug that will display before each term
        'with_front' => false, // Don't display the category base before "/article_types/"
        'hierarchical' => true // This will allow URL's like "/article_types/boston/cambridge/"
      ),
    ));
  }
  add_action( 'init', 'add_article_type_taxonomy', 0 );


?>


