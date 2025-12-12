for (var i = 0; i < quantidade_por_ciclo; i++) {
    var xx = irandom_range(64, room_width - 64);
    var yy = irandom_range(64, room_height - 64);

    instance_create_layer(xx, yy, "Instances", obj_sombra_tentaculo);
}

// chance de spawnar em cima do player
if (irandom(5) == 0) {
    instance_create_layer(oPlayer.x, oPlayer.y, "Instances", obj_sombra_tentaculo);
}

alarm[0] = intervalo_sombras;
