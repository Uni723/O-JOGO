draw_self();

// opcional: indicador “Pressione E” quando perto
if (instance_exists(player_obj)) {
    var p = instance_nearest(x, y, player_obj);
    if (p != noone) {
        var d = point_distance(x, y, p.x, p.y);
        if (d < distancia_ativacao && !fala_ativa) {
            draw_set_alpha(0.7);
            draw_set_color(c_white);
            draw_text(x, y - 48, "[E] Falar");
            draw_set_alpha(1);
        }
    }
}
