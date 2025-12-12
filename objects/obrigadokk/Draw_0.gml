/// DRAW EVENT – Renderização da tela

// Fundo escuro
draw_clear(make_color_rgb(10, 10, 10));

// Alinhamento do texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ----- TÍTULO GIGANTE -----
draw_set_color(c_white);
draw_text_transformed(
    room_width * 0.5,
    room_height * 0.5 - 80,
    msg_title,
    scale_title,
    scale_title,
    0
);

// ----- SUBTÍTULO -----
draw_set_color(c_gray);
draw_text_transformed(
    room_width * 0.5,
    room_height * 0.5 + 60,
    msg_sub,
    scale_sub,
    scale_sub,
    0
);
