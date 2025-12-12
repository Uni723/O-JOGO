// fase 0: crescendo
if (fase == 0) {
    if (image_yscale < max_height) {
        image_yscale += stretch_speed;
    }
}

// fase 2: sumindo
if (fase == 2) {
    image_alpha -= 0.05;
    image_yscale -= 0.04;

    if (image_alpha <= 0) {
        // destruir sombra junto
        if (instance_exists(sombra_id)) {
            with (sombra_id) instance_destroy();
        }
        instance_destroy();
    }
}

// tremida sempre
x = orig_x + random_range(-shake_intensity, shake_intensity);
y = orig_y + random_range(-shake_intensity, shake_intensity);
