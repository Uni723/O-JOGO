/// --- FUNDO ANIMADO ---
var wave = sin(current_time * 0.001) * 7;
draw_sprite_stretched(spr_fundo_menu, 0, wave, 0, display_get_gui_width() + 20, display_get_gui_height());


/// --- CONFIGURAÇÕES ---
var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;

// Fonte Beachday
draw_set_font(fnt_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);


/// --- ESTILO VISUAL ---
var base_scale = 3.3;       // tamanho geral das letras
var hover_scale = 3.3;      // tamanho quando selecionado
var item_spacing = 100;      // distância entre os itens
var wave_intensity = 0.005; // intensidade do movimento leve nas letras (opcional)


/// --- DESENHO DOS ITENS DE MENU ---
for (var i = 0; i < array_length(menu_items); i++) {
    var scale;
    var alpha;
    var color;

    if (i == menu_index) {
        scale = hover_scale;
        alpha = 1;
        color = c_white;
    } else {
        scale = base_scale;
        alpha = 0.5;
        color = c_white;
    }

    // movimento suave tipo “flutuar”
    var float_y = sin(current_time * wave_intensity + i) * 5;
    var item_y = cy + (i * item_spacing) + float_y;

    draw_set_alpha(alpha);
    draw_set_color(color);
    draw_text_transformed(cx, item_y, string(menu_items[i]), scale, scale, 0);
}

draw_set_alpha(1);


/// --- FADE ---
if (fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}
