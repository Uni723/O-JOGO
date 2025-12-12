// garante que a variável existe
if (!variable_global_exists("musica_atual")) {
    global.musica_atual = -1;
}

// se nenhuma música estiver tocando, toca a música do menu
if (!audio_is_playing(global.musica_atual)) {
    global.musica_atual = audio_play_sound(musicafundo, 1, true);
}
