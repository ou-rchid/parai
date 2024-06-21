<?php
// Template Name: Custom-Form-Display
get_header();
global $wpdb;
$table_name = $wpdb->prefix . 'cto_custom_form_data_test';

// Pagination variables
$page = isset($_GET['page']) ? intval($_GET['page']) : 1; // Current page number
$perPage = 4; // Number of items per page

// Calculate total number of items
$totalItems = $wpdb->get_var("SELECT COUNT(*) FROM $table_name");

// Calculate total number of pages
$totalPages = ceil($totalItems / $perPage);

// Adjust page number if out of bounds
if ($page < 1) {
    $page = 1;
} elseif ($page > $totalPages) {
    $page = $totalPages;
}

// Calculate offset for SQL query
$offset = ($page - 1) * $perPage;

// Query with pagination
$query = $wpdb->prepare("SELECT * FROM $table_name ORDER BY id DESC LIMIT %d OFFSET %d", $perPage, $offset);
$results = $wpdb->get_results($query);
?>

<div class="container mt-5">
    <h2 class="mb-3">Form Data</h2>
    <?php if ($results) : ?>
        <div class="row">
            <?php foreach ($results as $test) : ?>
                <div class="col-md-3 custom-border">
                    <div class="styled-box">
                        <div class="grid-content">
                            <p><strong>Description:</strong> <?php echo esc_html($test->description); ?></p>
                            <p><strong>Adi:</strong> <?php echo esc_html($test->adi); ?></p>
                            <p><strong>Group:</strong> <?php echo esc_html($test->sgroup); ?></p>
                            <p><strong>Individual:</strong> <?php echo esc_html($test->individual); ?></p>
                            <p><strong>Place:</strong> <?php echo esc_html($test->place); ?></p>
                            <p><strong>Performance:</strong> <?php echo esc_html($test->performance); ?></p>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
        <!-- Pagination -->
<div class="pagination">
    <?php if ($page > 1) : ?>
        <a href="?page=<?php echo $page - 1; ?>">&laquo; Previous</a>
    <?php endif; ?>

    <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
        <a href="?page=<?php echo $i; ?>" class="<?php if ($i == $page) echo 'active'; ?>"><?php echo $i; ?></a>
    <?php endfor; ?>

    <?php if ($page < $totalPages) : ?>
        <a href="?page=<?php echo $page + 1; ?>">Next &raquo;</a>
    <?php endif; ?>
</div>

     

    <?php else : ?>
        <p>No data found.</p>
    <?php endif; ?>
</div>

<?php
get_footer();
?>

