/// DRAW GUI — HUD com corações maiores e visível em todas as salas (menos menu)

if (!visible) return;
if (!instance_exists(player)) return;

// pega vida do player
var vida = player.vida;
var vida_max = player.vida_max;

// config
var margin_x = 32;  // maior margem para compensar corações maiores
var margin_y = 32;
var spacing = 70;   // mais espaço entre corações
var scale = 1.5;      // <<< AQUI você aumenta o tamanho

// desenha corações
for (var i = 0; i < vida_max; i++)
{
    var cx = margin_x + i * spacing;
    var cy = margin_y;

    if (i < vida) {
        // coração vivo
        draw_sprite_ext(spr_coracao, 0, cx, cy, scale, scale, 0, c_white, 1);
    }
    // se o coração estiver perdido, simplesmente não desenha = desaparece
}
