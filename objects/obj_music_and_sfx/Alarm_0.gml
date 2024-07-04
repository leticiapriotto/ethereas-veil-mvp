/// @description sets music and sfx volume

audio_group_set_gain(audiogroup_musics, global.music_volume, 0);
audio_group_set_gain(audiogroup_sound_effects, global.sfx_volume, 0);

if (!audio_is_playing(snd_menu_music)) {
    audio_play_sound(snd_menu_music, 10, true);
}
