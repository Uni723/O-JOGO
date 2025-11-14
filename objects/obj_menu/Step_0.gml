/// --- CONTROLE DE FADE ---
if (fade_state == "in") {
    fade_alpha = max(0, fade_alpha - fade_speed);
    if (fade_alpha <= 0) fade_state = "idle"; // quando o fade termina, habilita o menu
}
else if (fade_state == "out") {
    fade_alpha = min(1, fade_alpha + fade_speed);
    if (fade_alpha >= 1 && next_room != noone) {
        room_goto(next_room);
    }
}
else if (fade_state == "idle") {

    /// --- NAVEGAÇÃO PELO TECLADO ---
    if (keyboard_check_pressed(vk_down)) menu_index++;
    if (keyboard_check_pressed(vk_up)) menu_index--;

    if (menu_index < 0) menu_index = array_length(menu_items) - 1;
    if (menu_index >= array_length(menu_items)) menu_index = 0;

    /// --- DETECÇÃO DO MOUSE ---
    var mx = device_mouse_x(0);
    var my = device_mouse_y(0);

    for (var i = 0; i < array_length(menu_items); i++) {
        var item_y = cy + i * item_spacing;
        var text_w = string_width(menu_items[i]);
        var text_h = string_height(menu_items[i]);

        if (mx > cx - text_w/2 && mx < cx + text_w/2 &&
            my > item_y - text_h/2 && my < item_y + text_h/2) {
            menu_index = i;

            // Clique do mouse
            if (mouse_check_button_pressed(mb_left)) {
                switch(i) {
                    case 0: // Jogar
                        fade_state = "out";
                        next_room = Room1; // substitua com o nome exato da sua room
                        break;
                    case 1: // Opções
                        // exemplo: room_goto(rm_opcoes);
                        break;
                    case 2: // Sair
                        game_end();
                        break;
                }
            }
        }
    }

    /// --- TECLA ENTER ---
    if (keyboard_check_pressed(vk_enter)) {
        switch(menu_index) {
            case 0:
                fade_state = "out";
                next_room = Room1;
                break;
            case 1:
                // room_goto(rm_opcoes);
                break;
            case 2:
                game_end();
                break;
        }
    }
}
