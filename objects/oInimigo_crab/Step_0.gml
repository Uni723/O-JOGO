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
    } else {
        if (random(2) < stay_still_chance) {
            is_moving = false;
        } else {
            is_moving = true;
        }

        if (is_moving) {
            var distance_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
            if (distance_to_player < 200) {
                direction = point_direction(x, y, oPlayer.x, oPlayer.y);
            }
            x += lengthdir_x(speed, direction);
            y += lengthdir_y(speed, direction);
        }
    }
}
