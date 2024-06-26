<?php
// Register CMB2 fields for 'articles' custom post type
function parai_register_location_metabox() {
    $prefix = 'parai_';

    $cmb = new_cmb2_box(array(
        'id' => $prefix . 'location_metabox',
        'title' => esc_html__('Location', 'parai'),
        'object_types' => array('articles'), // Post type
        'context' => 'normal',
        'priority' => 'high',
    ));

    $cmb->add_field(array(
        'name' => esc_html__('Location', 'parai'),
        'id' => $prefix . 'location',
        'type' => 'text',
    ));
}
add_action('cmb2_init', 'parai_register_location_metabox');
?>
