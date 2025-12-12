/// obj_tiro_ostra - Step

// Destruir ao colidir com um sólido (substitua obj_solid pelo seu objeto de muro)
if (place_meeting(x, y, Oparede)) {
    instance_destroy();
    exit;
}

// Colisão com player: causa dano e se destrói
var inst = instance_place(x, y, oPlayer);
if (inst != noone) {
    with (inst) {
        // exemplo simples: reduzir vida; ajuste ao seu sistema de vida
        if (variable_local_exists("vida")) {
            vida -= other.damage;
        } else {
            // se seu player usa outro nome, ajuste aqui
        }
    }
    instance_destroy();
}
