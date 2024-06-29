/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Alarm[0] do obj_music_and_sound_effects
audio_group_set_gain(audiogroup_musics, global.music_volume, 0);
audio_group_set_gain(audiogroup_sound_effects, global.sfx_volume, 0);

if (!audio_is_playing(snd_menu_music)) {
    audio_play_sound(snd_menu_music, 10, true);
}
