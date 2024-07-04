/// @description music_volume to value

// Inherit the parent event
event_inherited();
global.music_volume = value;
audio_group_set_gain(audiogroup_musics, global.music_volume, 0);