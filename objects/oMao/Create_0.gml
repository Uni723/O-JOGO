atirar = false;
delay_tiro = 4;
velocidade = 7;
espera_tiro = 0.3;

atirando = function() {
    if (atirar) {
        delay_tiro--;
        if (delay_tiro <= 0) {
            delay_tiro = espera_tiro * room_speed;
            
            var distance_from_arma = sprite_width / 7;
            var _x = lengthdir_x(distance_from_arma, image_angle);
            var _y = lengthdir_y(distance_from_arma, image_angle);
            
            var _tiro = instance_create_layer(x + _x, y + _y, layer, tiro);
            _tiro.speed = velocidade;
            
            // Define a direção do tiro para seguir o mouse
            _tiro.direction = point_direction(x, y, mouse_x, mouse_y);
        }
    }
}