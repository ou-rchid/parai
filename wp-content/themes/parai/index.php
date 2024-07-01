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

<!-- Container for the map -->
<h1>Header Goes Here</h1>

<div class="container">
    <div id="map"></div>
</div>

<!-- Modal for displaying detailed information -->
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

<!-- this query is for displaying articles in the google map above -->
<?php
    // Query to fetch all articles
    $args = array(
        'post_type' => 'articles',
        'posts_per_page' => -1
    );
    $articles = new WP_Query($args);

    // Array to store location data for the map
    $locations = array();

    // Loop through each article and extract necessary data
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

            // Add location data to the array if both latitude and longitude are available
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


<!-- the following code will give you the list of articles in the html cards -->
<?php
    //In this file we want to show the "articles post type" in map (e.g., zillow)
    // How to query a custom post types: https://developer.wordpress.org/plugins/post-types/working-with-custom-post-types/

    $loop = new WP_Query(
        array(
            'post_type'  => 'articles',
        )
    );
    
    //loop through the articles
    while ( $loop->have_posts() ) {  $loop->the_post(); 
    
    //the Lat Long values of each of the article
    $location = get_post_meta( get_the_ID(), 'location_hardcoded', true );
    
?>

        <!-- Card for each of the Article -->
        <div class="card" style="width: 18rem;">
            
            <?php if( has_post_thumbnail() ):?>
                <a href="<?php the_permalink(); ?>"> 
                    <?php the_post_thumbnail('medium', array('class' => 'card-img-top')); ?>
                </a>
            <?php endif; ?>

            <div class="card-body">
                <h5 class="card-title"><a href="<?php the_permalink(); ?>"> <?php the_title(); ?></a></h5>
                <!-- Location of the Article. Lat Long value you aded while creating the article-->
                <p class="card-text"><?php echo $location; ?></p>
            </div>
        </div>
    
<?php 
wp_reset_postdata();
    }
?>

<script>
    var locations = <?php echo json_encode($locations); ?>;
</script>



<?php get_footer(); ?>
