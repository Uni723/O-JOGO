draw_self();

// Desenha o balão de fala se estiver ativo
if (fala_ativa) {
    var largura = string_width(texto_completo) + 20;
    var altura = 36;
    var pos_x = x - largura / 2;
    var pos_y = y - sprite_height - 40;

    // Caixa de diálogo (estilo Undertale)
    draw_set_color(c_white);
    draw_rectangle(pos_x, pos_y, pos_x + largura, pos_y + altura, false);
    draw_set_color(c_black);
    draw_rectangle(pos_x, pos_y, pos_x + largura, pos_y + altura, true);

    // Texto atual
    draw_text(pos_x + 10, pos_y + 10, texto_atual);

    // Mostra uma setinha se o texto terminou
    if (fala_finalizada) {
        draw_text(pos_x + largura - 20, pos_y + altura - 16, "▼");
    }
}
else {
    // Se o jogador estiver perto, mostra um aviso para apertar E
    if (instance_exists(oPlayer)) {
        var dist = point_distance(x, y, oPlayer.x, oPlayer.y);
        if (dist < distancia_ativar) {
            draw_text(x - 40, y - sprite_height - 20, "Pressione E");
        }
    }
}
