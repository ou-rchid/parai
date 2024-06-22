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
    }
?>

<gmp-map
      center="43.4142989,-124.2301242"
      zoom="4"
      map-id="DEMO_MAP_ID"
      style="height: 400px"
    >
      <gmp-advanced-marker
        position="37.4220656,-122.0840897"
        title="Mountain View, CA"
      ></gmp-advanced-marker>
      <gmp-advanced-marker
        position="47.648994,-122.3503845"
        title="Seattle, WA"
      ></gmp-advanced-marker>
    </gmp-map>



<?php get_footer(); ?>
