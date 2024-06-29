/// @description load music and setup
// Evento Create do obj_music_and_sound_effects
audio_group_load(audiogroup_musics);
audio_group_load(audiogroup_sound_effects);

global.music_volume = variable_global_exists("music_volume") ? variable_global_get("music_volume") : 0.5;
global.sfx_volume = variable_global_exists("sfx_volume") ? variable_global_get("sfx_volume") : 0.5;

sound_effects_loaded = false;
music_loaded = false;

// Aguarda um frame antes de definir o volume para garantir que os grupos estejam carregados
alarm[0] = 1;
