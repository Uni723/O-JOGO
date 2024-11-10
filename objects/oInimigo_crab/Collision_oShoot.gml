if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, oShoot, false, true)) {
    var tiro = collision_rectangle(x, y, x + sprite_width, y + sprite_height, oShoot, false, true);
    
    if (tiro) {
        vida_atual -= 1; // Reduz a saúde do inimigo

    
        // Aplica knockback
        knockback_duration = 10; // Duração do knockback (ajuste conforme necessário)
        direction = point_direction(x, y, tiro.x, tiro.y); // Direção do tiro

        // Aplica um deslocamento inicial para o knockback
        x += lengthdir_x(knockback_force, direction + 180);
        y += lengthdir_y(knockback_force, direction + 180);

        // Verifica se a saúde do inimigo chegou a zero
        if (vida_atual <= 0) {
            instance_destroy(); // Destroi o inimigo se a saúde for menor ou igual a zero
        }

        instance_destroy(tiro); // Destroi o tiro
    }
}