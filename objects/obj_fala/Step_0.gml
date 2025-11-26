// efeito de digitação
if (string_length(texto_atual) < string_length(texto)) {
    timer_texto += 1;
    if (timer_texto % velocidade_texto == 0) {
        var i = string_length(texto_atual) + 1;
        texto_atual = string_copy(texto, 1, i);
    }
}

