<?php

function add_style_script()
{
    wp_enqueue_style( 'bootstrap-css', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css');
    wp_enqueue_style( 'parai_style', get_stylesheet_uri() );
    wp_enqueue_script( 'bootstrap-js', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js', array('jquery'), null, true );
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


function register_video_post_type() {
    $labels = array(
        'name'                => _x( 'Videos', 'Post Type General Name', 'parai' ),
        'singular_name'       => _x( 'Video', 'Post Type Singular Name', 'parai' ),
        'menu_name'           => __( 'Videos', 'parai' ),
        'parent_item_colon'   => __( 'Parent Video', 'parai' ),
        'all_items'           => __( 'All Videos', 'parai' ),
        'view_item'           => __( 'View Video', 'parai' ),
        'add_new_item'        => __( 'Add New Video', 'parai' ),
        'add_new'             => __( 'Add New', 'parai' ),
        'edit_item'           => __( 'Edit Video', 'parai' ),
        'update_item'         => __( 'Update Video', 'parai' ),
        'search_items'        => __( 'Search Videos', 'parai' ),
        'not_found'           => __( 'Not Found', 'parai' ),
        'not_found_in_trash'  => __( 'Not found in Trash', 'parai' ),
    );
    $args = array(
        'label'               => __( 'video', 'parai' ),
        'description'         => __( 'Video news and reviews', 'parai' ),
        'labels'              => $labels,
        'supports'            => array( 'title','template', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields' ),
        'taxonomies'          => array( 'category', 'post_tag' ),
        'hierarchical'        => false,
        'public'              => true,
        'show_ui'             => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'show_in_admin_bar'   => true,
        'menu_position'       => 6,
        'can_export'          => true,
        'has_archive'         => true,
        'exclude_from_search' => false,
        'publicly_queryable'  => true,
        'capability_type'     => 'post',
        'show_in_rest'        => true,
    );

    register_post_type( 'video', $args );  // Corrected line
}
add_action( 'init', 'register_video_post_type' );  // Corrected function name

// Shortcode to display the video upload form
function video_upload_form_shortcode() {
    ob_start(); // Start output buffering
    ?>
    <form action="<?php echo esc_url(admin_url('admin-post.php')); ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="handle_video_upload">
        <label for="video_title">Title:</label>
        <input type="text" id="video_title" name="video_title" required><br>
        <label for="video_file">Choose Video:</label>
        <input type="file" id="video_file" name="video_file" accept="video/*" required><br>
        <?php wp_nonce_field('video_upload_nonce', 'video_upload_nonce_field'); ?>
        <input type="submit" value="Upload Video">
    </form>
    <?php
    return ob_get_clean(); // Return the buffered content
}
add_shortcode('video_upload_form', 'video_upload_form_shortcode');


function handle_video_upload() {
    // Check nonce for security
    if (!isset($_POST['video_upload_nonce_field']) || !wp_verify_nonce($_POST['video_upload_nonce_field'], 'video_upload_nonce')) {
        wp_die('Security check failed.');
    }

    // Check user capabilities
    if (!current_user_can('upload_files')) {
        wp_die('Permission denied.');
    }

    // Check for the file upload
    if (!empty($_FILES['video_file']['name'])) {
        $uploaded_file = $_FILES['video_file'];

        // Handle the file upload
        $upload = wp_handle_upload($uploaded_file, array('test_form' => false));

        if (isset($upload['error']) && $upload['error'] !== 0) {
            wp_die('There was an error uploading your video: ' . $upload['error']);
        } else {
            $file_url = $upload['url'];
            $file_type = $upload['type'];
            $file_name = basename($upload['file']);

            // Create the attachment
            $attachment = array(
                'guid' => $file_url,
                'post_mime_type' => $file_type,
                'post_title' => sanitize_file_name($file_name),
                'post_content' => '',
                'post_status' => 'inherit'
            );

            // Insert the attachment
            $attach_id = wp_insert_attachment($attachment, $upload['file']);

            // Include image.php
            require_once(ABSPATH . 'wp-admin/includes/image.php');

            // Generate the attachment metadata
            $attach_data = wp_generate_attachment_metadata($attach_id, $upload['file']);

            // Update the metadata
            wp_update_attachment_metadata($attach_id, $attach_data);

            // Create a new post of custom post type 'video'
            $post_data = array(
                'post_title' => sanitize_text_field($_POST['video_title']),
                'post_content' => '',
                'post_status' => 'publish',
                'post_type' => 'video'
            );

            $post_id = wp_insert_post($post_data);

            if ($post_id) {
                // Associate the video attachment with the post
                update_post_meta($post_id, '_video_attachment_id', $attach_id);

                wp_redirect(home_url('/thank-you')); // Redirect to a thank you page
                exit;
            } else {
                wp_die('Error creating video post.');
            }
        }
    } else {
        wp_die('No file uploaded.');
    }
}
add_action('admin_post_nopriv_handle_video_upload', 'handle_video_upload');
add_action('admin_post_handle_video_upload', 'handle_video_upload');











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
        'supports'            => array( 'title', 'editor','template', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'custom-fields'),
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

// Add metaboxes
function articles_meta_box() {
    add_meta_box(
        'articles_meta', 
        'Article Details', 
        'articles_meta_box_html', 
        'articles', 
        'normal', 
        'high' 
    );
}
add_action( 'add_meta_boxes', 'articles_meta_box' );

function articles_meta_box_html( $post ) {

    
    #$meta_value = get_post_meta( $post->ID,'edit_count', true);

    
    $meta_value = get_post_meta( $post->ID,'edit_count', true);
    ?>
    <label for="article_author">Author</label>
    <input type="text" name="article_author" id="article_author" value="<?php echo isset( $meta_value['article_author'] ) ? esc_attr( $meta_value['article_author'][0] ) : ''; ?>" class="form-control" />

    <label for="article_publisher">Publisher</label>
    <input type="text" name="article_publisher" id="article_publisher" value="<?php echo isset( $meta_value['article_publisher'] ) ? esc_attr( $meta_value['article_publisher'][0] ) : ''; ?>" class="form-control" />

    <label for="article_pub_date">Publication Date</label>
    <input type="date" name="article_pub_date" id="article_pub_date" value="<?php echo isset( $meta_value['article_pub_date'] ) ? esc_attr( $meta_value['article_pub_date'][0] ) : ''; ?>" class="form-control" />

    <?php
    wp_nonce_field( 'articles_meta_box_nonce', 'articles_meta_box_nonce' );
}

function save_articles_meta_box_data( $post_id ) {
    
    if ( ! isset( $_POST['articles_meta_box_nonce'] ) ) {
        return $post_id;
    }

    $nonce = $_POST['articles_meta_box_nonce'];

    if ( ! wp_verify_nonce( $nonce, 'articles_meta_box_nonce' ) ) {
        return $post_id;
    }

    if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
        return $post_id;
    }

    if ( 'articles' == $_POST['post_type'] ) {
        if ( ! current_user_can( 'edit_post', $post_id ) ) {
            return $post_id;
        }
    } else {
        if ( ! current_user_can( 'edit_post', $post_id ) ) {
            return $post_id;
        }
    }

    // Define an array of meta keys to update dynamically
    $meta_fields = array(
        'article_author',
        'article_publisher',
        'article_pub_date',
       
    );

    // Loop through each meta field to sanitize and save data
    foreach ( $meta_fields as $meta_key ) {
        if ( isset( $_POST[ $meta_key ] ) ) {
            $meta_value = sanitize_text_field( $_POST[ $meta_key ] );
            
            update_post_meta( $post_id, $meta_key, $meta_value );
        }
    }
    
    // $article_author = sanitize_text_field( $_POST['article_author'] );
    // $article_publisher = sanitize_text_field( $_POST['article_publisher'] );
    // $article_pub_date = sanitize_text_field( $_POST['article_pub_date'] );
    
    // update_post_meta( $post_id, 'article_author', $article_author );
    // update_post_meta( $post_id, 'article_publisher', $article_publisher );
    // update_post_meta( $post_id, 'article_pub_date', $article_pub_date );
}
add_action( 'save_post', 'save_articles_meta_box_data' );

function additional_metaboxes() {
    $cmb = new_cmb2_box(array(
        'id'            => 'additional_metabox',
        'title'         => __('Additional Info', 'cmb2'),
        'object_types'  => array('articles'),
        'context'       => 'normal',
        'priority'      => 'high',
        'show_names'    => true,
    ));

    $cmb->add_field(array(
        'name' => __('Subtitle', 'cmb2'),
        'desc' => __('Enter a subtitle for the article', 'cmb2'),
        'id'   => 'article_subtitle',
        'type' => 'text',
    ));

    $cmb->add_field(array(
        'name' => __('Music Instrument', 'cmb2'),
        'desc' => __('Enter the related music instrument', 'cmb2'),
        'id'   => 'article_instrument',
        'type' => 'text',
    ));

    $cmb->add_field(array(
        'name' => __('Duration', 'cmb2'),
        'desc' => __('Enter the duration of the performance in minutes', 'cmb2'),
        'id'   => 'article_duration',
        'type' => 'text',
    ));
}
add_action('cmb2_admin_init', 'additional_metaboxes');

function create_custom_table() {
    global $wpdb;

    $table_name = $wpdb->prefix . 'cto_custom_form_data_test';
    
    $charset_collate = $wpdb->get_charset_collate();

   /* $sql = "CREATE TABLE $table_name (
        id mediumint(9) NOT NULL AUTO_INCREMENT,
        name tinytext NOT NULL,
        email text NOT NULL,
        message text NOT NULL,
        PRIMARY KEY  (id)
    ) $charset_collate;";*/

    $sql = "CREATE TABLE $table_name (
        id mediumint(9) NOT NULL AUTO_INCREMENT,
        description tinytext NOT NULL,
        adi text NOT NULL,
        sgroup text NOT NULL,
        individual text NOT NULL,
        place  text NOT NULL,
        performance text NOT NULL,
        PRIMARY KEY  (id)
    ) $charset_collate;";

    require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
    dbDelta($sql);
}

add_action('after_setup_theme', 'create_custom_table');


function handle_custom_form() {
    if ( isset($_POST['description']) && isset($_POST['adi']) && isset($_POST['sgroup']) && isset($_POST['individual']) && isset($_POST['place'])&& isset($_POST['performance'])) {
        global $wpdb;
        
        $table_name = $wpdb->prefix . 'cto_custom_form_data_test';
        
        $description = sanitize_text_field($_POST['description']);
        $adi = sanitize_text_field($_POST['adi']);
        $sgroup = sanitize_text_field($_POST['sgroup']);
        $individual = sanitize_text_field($_POST['individual']);
        $place  = sanitize_text_field($_POST['place']);
        $performance  = sanitize_text_field($_POST['performance']);
        
        $wpdb->insert(
            $table_name,
            array(
                'description' => $description,
                'adi' => $adi,
                'sgroup' => $sgroup,
                'individual' => $individual,
                'place' => $place,
                'performance' => $performance,
            )
        );

        wp_redirect(home_url('display/')); // Redirect to a thank you page
        exit;
    }
}

add_action('admin_post_nopriv_custom_form_action', 'handle_custom_form');
add_action('admin_post_custom_form_action', 'handle_custom_form');












?>








