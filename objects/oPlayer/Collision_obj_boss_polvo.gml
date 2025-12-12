
if (!invul) {

    vida -= 1;

    // Ativa invulnerabilidade
    invul = true;
    invul_timer = invul_time_max;

    // Knockback opcional
    var dx = x - other.x;
    var dy = y - other.y;
    var knock = 4;
    x += lengthdir_x(knock, point_direction(other.x, other.y, x, y));
    y += lengthdir_y(knock, point_direction(other.x, other.y, x, y));
}
