dano = 1;

image_xscale = 1.5;
image_yscale = 0.1;  // começa pequeno

max_height = 6; // ANTES era 2.2 → agora MUITO maior
stretch_speed = 0.04; // estica mais devagar (opcional)
shake_intensity = 3.0; // tremida maior

orig_x = x;
orig_y = y;

fase = 0; // 0 crescendo, 1 ativo, 2 sumindo

tempo_crescer = 40;  // mais lento
tempo_ativo   = 50;
tempo_sumir   = 30;

alarm[0] = tempo_crescer;

sombra_id = noone; // será preenchido pela sombra
