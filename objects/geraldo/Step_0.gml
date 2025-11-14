if (instance_exists(oPlayer)) {
    var dist = point_distance(x, y, oPlayer.x, oPlayer.y);

    // Se o jogador está perto e aperta E, começa o diálogo
    if (dist < distancia_ativar && keyboard_check_pressed(ord("E")) && !fala_ativa) {
        fala_ativa = true;
        fala_finalizada = false;
        texto_atual = "";
        contador_texto = 0;
    }
}

// Se a fala está ativa, anima o texto sendo digitado
if (fala_ativa && !fala_finalizada) {
    contador_texto += 1;
    if (contador_texto >= velocidade_texto) {
        contador_texto = 0;
        var tamanho = string_length(texto_atual);
        if (tamanho < string_length(texto_completo)) {
            texto_atual = string_copy(texto_completo, 1, tamanho + 1);
            // (opcional) Som de letra:
            // audio_play_sound(snd_text_bip, 0, false);
        } else {
            fala_finalizada = true; // terminou o texto
        }
    }
}

// Fecha o balão quando o texto acabou e o jogador aperta Z
if (fala_ativa && fala_finalizada && keyboard_check_pressed(ord("Z"))) {
    fala_ativa = false;
}
