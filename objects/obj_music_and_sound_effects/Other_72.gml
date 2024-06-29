/// @description Inserir descrição aqui

variable_global_set("music_volume", global.music_volume);
variable_global_set("sfx_volume", global.sfx_volume);

if (audio_group_is_loaded(audiogroup_musics)) {
    music_loaded = true;
    
    if (!audio_is_playing(music_playing)) {
        audio_play_sound(snd_menu_music, 10, true);
    }
}

if (audio_group_is_loaded(audiogroup_sound_effects)) {
    sound_effects_loaded = true;
}

