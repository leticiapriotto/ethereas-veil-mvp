/// @description music and sfx setup

// music setup
audio_group_load(audiogroup_musics);
global.music_volume = variable_global_exists("music_volume") ? variable_global_get("music_volume") : 0.5;
music_loaded = false;

// sfx setup
audio_group_load(audiogroup_sound_effects);
global.sfx_volume = variable_global_exists("sfx_volume") ? variable_global_get("sfx_volume") : 0.5;
sound_effects_loaded = false;

// waits one frame to make sure that the audriogroups are loaded
alarm[0] = 1;
