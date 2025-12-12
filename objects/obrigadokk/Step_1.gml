/// STEP EVENT – Controle de entrada e saída

// Contagem regressiva
timer--;

// Voltar ao menu com ENTER
if (keyboard_check_pressed(vk_enter)) {
    room_goto(rm_menu);
}

// Voltar quando o tempo acabar
if (timer <= 0) {
    room_goto(rm_menu);
}
