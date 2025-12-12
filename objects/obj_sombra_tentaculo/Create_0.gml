image_alpha = 0;
image_xscale = 0.8;
image_yscale = 0.8;


fade_speed = 0.015;   // mais lento
grow_speed = 0.01;    // mais lento

tempo_total = irandom_range(80, 120); // tempo antes do tentáculo surgir
alarm[0] = tempo_total;

// tremida
shake_intensity = 1.2;
orig_x = x;
orig_y = y;
