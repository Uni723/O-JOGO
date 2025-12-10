// 1. PEGA A DISTÂNCIA ATUAL PRO PLAYER
var dist = point_distance(x, y, player.x, player.y);

// 2. TESTA SE TEM PAREDE ENTRE OS DOIS
var parede_no_caminho = collision_line(x, y, player.x, player.y, Oparede, true, true);

// 3. ATUALIZA O ESTADO
if (dist < dist_ver && !parede_no_caminho) {
    estado = "perseguir";
} else {
    estado = "patrulha";
}


// ==============================
// ESTADO: SEGUIR PLAYER
// ==============================
if (estado == "perseguir")
{
    var dir_para_player = point_direction(x, y, player.x, player.y);
    
    // Movimento
    var mx = lengthdir_x(vel, dir_para_player);
    var my = lengthdir_y(vel, dir_para_player);
    
    // Evita atravessar paredes
    if (!place_meeting(x + mx, y, Oparede))
        x += mx;
    if (!place_meeting(x, y + my, Oparede))
        y += my;
}


// ==============================
// ESTADO: PATRULHA
// ==============================
if (estado == "patrulha")
{
    // Anda horizontalmente
    if (!place_meeting(x + vel * dir, y, Oparede)) {
        x += vel * dir;
    } else {
        dir *= -1; // bateu na parede, vira
    }
}
if (knockback_duration > 0) {
    var knockback_direction = direction + 180; 
    var new_x = x + lengthdir_x(knockback_force, knockback_direction);
    var new_y = y + lengthdir_y(knockback_force, knockback_direction);


    if (!place_meeting(new_x, new_y, Oparede) && !place_meeting(new_x, new_y, Oparede2)) {
        x = new_x;
        y = new_y;
    } else {
		
       
        for (var i = 0; i < knockback_force; i++) {
            if (!place_meeting(x + lengthdir_x(1, knockback_direction), y + lengthdir_y(1, knockback_direction), Oparede) &&
                !place_meeting(x + lengthdir_x(1, knockback_direction), y + lengthdir_y(1, knockback_direction), Oparede2)) {
                
                x += lengthdir_x(1, knockback_direction);
                y += lengthdir_y(1, knockback_direction);
                break; 
            }
        }
    }

    knockback_duration--;  
} else {

    if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), Oparede) ||
        place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), Oparede2)) {
        
        direction = random(360);
		}
}