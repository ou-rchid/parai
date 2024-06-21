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
                    // Retrieve all meta data for the current post
                    $post_meta = get_post_meta(get_the_ID());

                    if (!empty($post_meta)) : ?>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Meta Key</th>
                                    <th>Meta Value</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $counter = 0; // Initialize a counter
                                foreach ($post_meta as $meta_key => $meta_values) :
                                    foreach ($meta_values as $meta_value) :
                                        // Check if the counter has reached 5
                                        if ($counter >= 5) {
                                            break 2; // Exit both foreach loops
                                        }
                                        ?>
                                        <tr>
                                            <td><?php echo esc_html($meta_key); ?></td>
                                            <td><?php echo esc_html($meta_value); ?></td>
                                        </tr>
                                        <?php
                                        $counter++; // Increment the counter
                                    endforeach;
                                endforeach;
                                ?>
                            </tbody>
                        </table>
                    <?php else : ?>
                        <p>No meta data found.</p>
                    <?php endif; ?>
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
