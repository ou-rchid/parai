<?php
/**
 * In this file/page we want to show the "articles post type" in map (e.g., zillow)
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
    // Query to fetch all articles to show the article in the map
    // How to query a custom post types: https://developer.wordpress.org/plugins/post-types/working-with-custom-post-types/
    $args = array(
        'post_type' => 'articles',
        // 'posts_per_page' => -1,
        'paged'=>get_query_var('paged') ? get_query_var('paged') : 1,
    );
    
    // Array to store article data (title, location lat long, link, featured image) for the map
    $articles = array();

    $query_articles = new WP_Query($args);

    // Loop through each article and extract necessary data (title, featured image, location lat long)
    if ($query_articles->have_posts()) :?>


    <?php
        while ($query_articles->have_posts()) :
            
            $query_articles->the_post();
            // print_r(get_the_title());
            //the Lat Long values of each of the article
            $location = get_post_meta( get_the_ID(), 'location_hardcoded', true );
            $lat_lng = explode(',', $location);

            $lat = isset($lat_lng[0]) ? trim($lat_lng[0]) : '';
            $lng = isset($lat_lng[1]) ? trim($lat_lng[1]) : '';

            // $description = get_the_excerpt();

            // Get image URLs [How are these images going to shown in the popup bubble?]
            // $images = array();
            // $image_attachments = get_attached_media('image', get_the_ID());
            // foreach ($image_attachments as $image) {
            //     $images[] = wp_get_attachment_url($image->ID);
            // }

            // Get video URLs [How are these videos going to shown in the popup bubble?]
            // $videos = array();
            // $video_attachments = get_attached_media('video', get_the_ID());
            // foreach ($video_attachments as $video) {
            //     $videos[] = wp_get_attachment_url($video->ID);
            // }
            

            // Add location data to the array if both latitude and longitude are available
            // if ($lat && $lng) {
                $articles[] = array(
                    'lat' => $lat,
                    'lng' => $lng,
                    'title' => get_the_title(),
                    'id' => get_the_ID(),
                    'link' => get_permalink(get_the_ID()),
                    'thumbnail' => get_the_post_thumbnail_url(get_the_ID(), 'homepage-thumb'),
                    // 'description' => $description,
                    // 'images' => implode(',', $images), // comma-separated list of image URLs
                    // 'videos' => implode(',', $videos)  // comma-separated list of video URLs
                );
            // }
        endwhile;



?>

<?php
        // print_r($articles);

    endif;
    wp_reset_postdata();
?>


<!-- Container for the map -->
<div class="container-fluid">
    <div class="row">
        
        <div class="col-sm-10">
         
                <!-- <input
                    id="pac-input"
                    class="controls form-control"
                    type="text"
                    placeholder="Search Area"
                /> -->
        

            <div id="map"></div>
        </div>

        <div class="col-sm-2"> 
            <div id="sidebar"></div>


            <!-- Pagination -->
            <?php

                $total_pages = $query_articles->max_num_pages;

                if ($total_pages > 1){
            
                    $current_page = max(1, get_query_var('paged'));
            
                    echo paginate_links(array(
                        'base' => get_pagenum_link(1) . '%_%',
                        'format' => '/page/%#%',
                        'current' => $current_page,
                        'total' => $total_pages,
                        'prev_text'    => __('« prev'),
                        'next_text'    => __('next »'),
                    ));
                }    
            ?>


        </div>

       
    </div>
</div>





<script>
    // this is the latest updates on how to include Google Map API
//   (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    // key: "",
    // v: "weekly",
    // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
    // Add other bootstrap parameters as needed, using camel case.
//   });
    // this variable holds the articles data that will be displayed in the map
    var article_locations = <?php echo json_encode($articles); ?>    
    // console.log(article_locations);
</script>



<?php get_footer(); ?>
