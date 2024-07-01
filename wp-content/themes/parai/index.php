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
        'posts_per_page' => -1
    );
    
    $query_articles = new WP_Query($args);

    // Loop through each article and extract necessary data (title, featured image, location lat long)
    if ($query_articles->have_posts()) :
        while ($query_articles->have_posts()) :
            $query_articles->the_post();
            //the Lat Long values of each of the article
            $location = get_post_meta( get_the_ID(), 'location_hardcoded', true );
            $lat_lng = explode(',', $location);

            $lat = isset($lat_lng[0]) ? trim($lat_lng[0]) : '';
            $lng = isset($lat_lng[1]) ? trim($lat_lng[1]) : '';
            
            $lnk = get_permalink(get_the_ID());
            $thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'thumbnail');
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

            
            // Array to store article data (title, location lat long, link, featured image) for the map
            $articles = array();

            // Add location data to the array if both latitude and longitude are available
            if ($lat && $lng) {
                $articles[] = array(
                    'lat' => $lat,
                    'lng' => $lng,
                    'title' => get_the_title(),
                    'link' => $lnk,
                    'thumbnail' => $thumbnail,
                    // 'description' => $description,
                    // 'images' => implode(',', $images), // comma-separated list of image URLs
                    // 'videos' => implode(',', $videos)  // comma-separated list of video URLs
                );
            }
        endwhile;
    endif;
    wp_reset_postdata();
?>


<!-- Container for the map -->
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10"><div id="map"></div></div>
        <div class="col-sm-2"> List of the Articles will go here </div>
    </div>
</div>





<!-- the following code will give you the list of articles in the html cards -->
<?php /*
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
    */
?>


<script>
    // this is the latest updates on how to include Google Map API
  (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    key: "",
    v: "weekly",
    // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
    // Add other bootstrap parameters as needed, using camel case.
  });
    // this variable holds the articles data that will be displayed in the map
    var article_locations = <?php echo json_encode($articles); ?>    
</script>



<?php get_footer(); ?>
