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

	<div class="container">
		<?php if ( have_posts() ):?>
			<!-- // Load posts loop. -->
			<?php while ( have_posts() ) : the_post(); ?>	
				
					
				<?php if( has_post_thumbnail() ):?>						
					<?php the_post_thumbnail('full', array('class' => 'block mx-auto')); ?>						
				<?php endif; ?>

				<?php the_title('<h1>', '</h1>'); ?>
					
				<?php the_content(); ?>
					
				<!-- If comments are open or we have at least one comment, load up the comment template. -->
				<?php if ( comments_open() || get_comments_number() ) :
					comments_template();
				endif;?>
				
			<?php endwhile; ?>				
			
		<?php  else: ?>
			
			<?php echo "No content found!"; ?>
			
		<?php endif; ?>
		

	</div>

<?php get_footer(); ?>
