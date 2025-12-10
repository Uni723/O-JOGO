
velh = 0;
velv = 0;
max_vel = 5;

// Vida
vida_max = 4;
vida = vida_max;

// Invulnerabilidade
invul = false;
invul_timer = 0;
invul_time_max = 40; // ~0.6s

// Controle de piscar
blink = false;
blink_timer = 0;
blink_speed = 4;

max_vel = 5.5;
vel = 0;
move_dir = 0;
dano = false;
patrick = 0;
invulneravel = false;
invulneravel_timer = 0;


arma = instance_create_layer(x, y, "Instances", oMao);

usa_arma = function() {
    if (arma) {
        var _fire = mouse_check_button(mb_left);
        arma.atirar = _fire;

       
        var _dir = point_direction(x, y, mouse_x, mouse_y);
        
   
        var distance = sprite_width / 20;
        
  
        var _x = x + lengthdir_x(distance * image_xscale, _dir);
        var _y = y + lengthdir_y(distance * image_xscale, _dir);
        
       
        arma.x = _x;
        arma.y = _y;
        
        // Atualiza o ângulo da arma para o mesmo ângulo que o jogador
        if (image_xscale < 0) {
            arma.image_angle = _dir + 180;
        } else {
            arma.image_angle = _dir;
        }
        
        // Ajusta a escala da arma com base na escala do jogador
        arma.image_xscale = 1.2 * image_xscale;
        arma.image_yscale = 2;
    }
};
