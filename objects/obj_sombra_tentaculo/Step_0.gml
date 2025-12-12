// fade-in suave
if (image_alpha < 1) image_alpha += fade_speed;

// crescer lentamente
if (image_xscale < 2.0) image_xscale += grow_speed;
if (image_yscale < 2.0) image_yscale += grow_speed;

// tremida
x = orig_x + random_range(-shake_intensity, shake_intensity);
y = orig_y + random_range(-shake_intensity, shake_intensity);
