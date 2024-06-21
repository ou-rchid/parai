<?php
//get_header();
?>

<div class="container mt-5">
    <?php if (have_posts()) : ?>
        <?php while (have_posts()) : the_post(); ?>
            <div class="post">
                <h1 class="bg-primary text-white p-3"><?php the_title(); ?></h1>
                <div class="post-content mb-4">
                    <?php the_content(); ?>
                </div>

                <div class="article-meta p-3 bg-light">
                    <?php
                    $article_author = get_post_meta(get_the_ID(), 'article_author', true);
                    $article_publisher = get_post_meta(get_the_ID(), 'article_publisher', true);
                    $article_pub_date = get_post_meta(get_the_ID(), 'article_pub_date', true);
                    $article_instrument = get_post_meta(get_the_ID(), 'article_instrument', true);
                    $article_duration = get_post_meta(get_the_ID(), 'article_duration', true);
                    ?>
                    
                    <div class="row">
                       
                      
                        

                        

                      
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
    <?php else : ?>
        <p>No articles found.</p>
    <?php endif; ?>
</div>

<?php
//get_footer();
?>
