quantidade_por_ciclo = 2;  // só nasce 1 por vez
intervalo_sombras = 40;     // mais tempo entre sombras

alarm[0] = intervalo_sombras;

audio_play_sound(BOSS_POLVOO, 1, true);
// parar música anterior
if (audio_is_playing(global.musica_atual)) {
    audio_stop_sound(global.musica_atual);
}

// Tocar música do boss
audio_play_sound(BOSS_POLVOO, 1, true);
