// Aplicar fade-in
alpha_screen = min(alpha_screen + 0.02, 1);

// Atualizar ondas
wave_offset += 0.03;

// Aguardar antes de permitir reinício
restart_delay += 1;

// Reiniciar jogo ao apertar Enter
if (restart_delay > 30 && keyboard_check_pressed(vk_enter)) {
  room_goto(rm_menu); 
}
