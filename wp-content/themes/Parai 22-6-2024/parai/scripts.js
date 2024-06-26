document.addEventListener('DOMContentLoaded', function() {
    // Add any JavaScript functionalities you need here

    // Example: Toggle display of article metadata
    document.querySelectorAll('.article-meta-toggle').forEach(function(toggle) {
        toggle.addEventListener('click', function() {
            const meta = this.nextElementSibling;
            if (meta.style.display === 'none') {
                meta.style.display = 'block';
            } else {
                meta.style.display = 'none';
            }
        });
    });
});
