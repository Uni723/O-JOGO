if (invul) {
    invul_timer--;

    // Efeito de piscar
    blink_timer++;
    if (blink_timer > blink_speed) {
        blink = !blink;
        blink_timer = 0;
    }

    image_alpha = blink ? 0.3 : 1;

    if (invul_timer <= 0) {
        invul = false;
        image_alpha = 1;
    }
}

if (vida <= 0) {
    room_goto(morte_room); 
}
if (keyboard_check_pressed(ord("X")) && !invulneravel) {
    invulneravel = true;
    invulneravel_timer = room_speed *1.5
    sprite_index = Playeragua; 
    max_vel += 2; 
}


if (invulneravel) {
    invulneravel_timer -= 1;
    if (invulneravel_timer <= 0) {
        invulneravel = false;
        sprite_index = sPlayer; 
        max_vel -= 2; 
    }
}

if (patrick == 3) {
    room_goto_next();
}


var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
if (mouse_dir > 90 && mouse_dir < 270) {
    image_xscale = -1.5;
} else {
    image_xscale = 1.5;
}


if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))) {
    if (sprite_index != sCorrendo && !invulneravel) {
        sprite_index = sCorrendo;
    }
    move_dir = point_direction(0, 0, (keyboard_check(ord("D")) - keyboard_check(ord("A"))), (keyboard_check(ord("S")) - keyboard_check(ord("W"))));
} else {
    if (sprite_index != sPlayer && !invulneravel) {
        sprite_index = sPlayer;
    }
}


velh = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * max_vel;
velv = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * max_vel;

if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))) {
    vel = max_vel;
} else {
    vel = lerp(vel, 0, 0.1);
}

velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

// Movimento horizontal: ignora Oparede2 se invulnerável, mas sempre verifica Oparede
if (!place_meeting(x + velh, y, Oparede) && (invulneravel || !place_meeting(x + velh, y, Oparede2))) {
    x += velh;
}

// Movimento vertical: ignora Oparede2 se invulnerável, mas sempre verifica Oparede
if (!place_meeting(x, y + velv, Oparede) && (invulneravel || !place_meeting(x, y + velv, Oparede2))) {
    y += velv;
}


usa_arma();
