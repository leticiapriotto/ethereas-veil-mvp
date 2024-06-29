/// @description load music and setup
audio_group_load(audiogroup_musics);
audio_group_load(audiogroup_sound_effects);

if (!variable_global_exists("music_volume")) {
    global.music_volume = 0.5; // Volume da música (0 a 1)
} else {
    global.music_volume = variable_global_get("music_volume");
}

if (!variable_global_exists("sfx_volume")) {
    global.sfx_volume = 0.5; // Volume dos efeitos sonoros (0 a 1)
} else {
    global.sfx_volume = variable_global_get("sfx_volume");
}

audio_group_set_gain(audiogroup_musics, global.music_volume, 0);
audio_group_set_gain(audiogroup_sound_effects, global.sfx_volume, 0);

sound_effects_loaded = false;
music_loaded = false;
