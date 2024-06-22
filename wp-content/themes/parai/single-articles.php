<?php
/**
 * The single article template file
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package WordPress
 * @subpackage Twenty_Twenty_One
 * @since Twenty Twenty-One 1.0
 */

get_header(); ?>

		
		<?php if ( have_posts() ):?>
			<!-- // Load posts loop. -->
			<?php while ( have_posts() ) : the_post(); ?>	
				
				
					<?php if( has_post_thumbnail() ):?>						
						<?php the_post_thumbnail('full', array('class' => 'block mx-auto')); ?>						
					<?php endif; ?>

					<?php the_title('<h1>', '</h1>'); ?>
				
					<?php the_content(); ?>
					
				
			<?php endwhile; ?>				
			
		<?php  else: ?>
			
			<?php echo "No content found!"; ?>
			
		<?php endif; ?>



<?php get_footer(); ?>
