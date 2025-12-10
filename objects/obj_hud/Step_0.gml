/// STEP — garante que sempre encontre o player

// some no menu
if (room == menu_room) {
    visible = false;
    player = noone; // <- IMPORTANTE: reseta a referência
    exit;
} else {
    visible = true;
}

// sempre tenta achar o player
if (!instance_exists(player)) {
    if (instance_exists(oPlayer)) {
        player = instance_find(oPlayer, 0);
    }
}
