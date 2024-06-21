<?php
//get_header();
/*
* Template Name: Custom-Form
*/
?>

<div class="container mt-5">
    <form action="<?php echo esc_url(admin_url('admin-post.php')); ?>" method="post">
        <input type="hidden" name="action" value="custom_form_action">
        <label for="name">Description:</label>
        <input type="text" name="description" id="description" required>
        <br>
        <br>
        <label for="email">Adi:</label>
        <input type="text" name="adi" id="adi" required>
        <br>
        <br>
        <label for="message">Group:</label>
        <textarea name="sgroup" id="sgroup" required></textarea>
        <br>
        <br>
        <label for="message">Individual:</label>
        <textarea name="individual" id="individual" required></textarea>
        <br>
        <br>
        <label for="message">Place:</label>
        <textarea name="place" id="place" required></textarea>
        <br>
        <br>
        <label for="message">Performance:</label>
        <textarea name="performance" id="performance" required></textarea>
        <br>
        <br>
        <input type="submit" value="Submit">
    </form>

</div>

<?php
//get_footer();
?>
