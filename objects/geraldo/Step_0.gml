var p = instance_nearest(x, y, player_obj);

if (p != noone) {
    var d = point_distance(x, y, p.x, p.y);

    // Se o jogador estiver perto o suficiente
    if (d < distancia_ativacao) {

        // MOSTRA texto SÓ QUANDO APERTAR E
        if (keyboard_check_pressed(ord("E")) && !fala_ativa) {
            fala_ativa = true;
            fala_id = instance_create(x, y - 40, obj_fala);
        }
    }

    // Se afastou, destruir a fala
    if (fala_ativa && d > distancia_ativacao + 12) {
        fala_ativa = false;
        if (instance_exists(fala_id)) with (fala_id) instance_destroy();
        fala_id = noone;
    }
}
