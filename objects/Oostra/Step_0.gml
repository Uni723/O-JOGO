/// obj_ostra - Step

var p = instance_nearest(x, y, oPlayer);
if (!instance_exists(p)) exit;

// Distância do player
var d = point_distance(x, y, p.x, p.y);

// ABRIR / FECHAR A OSTRA
if (d <= dist_abrir) {
    aberta = true;
    invencivel = false;
    sprite_index = spr_aberta;
} else {
    aberta = false;
    invencivel = true;
    sprite_index = spr_fechada;
}

// ATAQUE
if (aberta) {
    if (cooldown > 0) cooldown -= 1;
    else {
        var dir = point_direction(x, y, p.x, p.y);

        var tiro = instance_create_depth(x, y, depth, obj_tiro_ostra);
        tiro.direction = dir;
        tiro.speed = 5;
        tiro.image_angle = dir;

        cooldown = cooldown_max;
    }
}
/// EFEITO DE TREMIDA AO TOMAR DANO
if (shake_time > 0) {
    shake_time -= 1;
    x += irandom_range(-shake_power, shake_power);
    y += irandom_range(-shake_power, shake_power);
}
