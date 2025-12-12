//--------------------------------------
// FUNDO COM FADE
//--------------------------------------
draw_set_alpha(alpha_screen);
draw_set_color(col_bg);
draw_rectangle(0, 0, room_width, room_height, false);


//--------------------------------------
// ONDAS ANIMADAS
//--------------------------------------
draw_set_color(col_wave);

var wave_height = 40;

for (var i = 0; i < room_width; i += 4) {
    var wave_y = room_height * 0.65
                 + sin((i * 0.03) + wave_offset) * wave_height;

    draw_line(i, wave_y, i, room_height);
}


//--------------------------------------
// TEXTO PRINCIPAL AUMENTADO
//--------------------------------------
draw_set_alpha(alpha_screen);
draw_set_font(fnt_menu);
draw_set_color(col_text);

// Texto principal (2x maior)
draw_text_transformed(
    room_width / 2 - (string_width(death_msg) * 2.5) / 2,
    room_height * 0.30,
    death_msg,
    2.5, 2.5, 0
);


//--------------------------------------
// TEXTO DE REINÍCIO (com piscar, maior)
//--------------------------------------
if (restart_delay > 30) {

    draw_set_alpha(alpha_screen * abs(sin(current_time * 0.003)));

    // Reiniciar (1.4x maior)
    draw_text_transformed(
        room_width / 2 - (string_width(restart_msg) * 1.4) / 2,
        room_height * 0.75,
        restart_msg,
        1.4, 1.4, 0
    );
}

draw_set_alpha(1);
