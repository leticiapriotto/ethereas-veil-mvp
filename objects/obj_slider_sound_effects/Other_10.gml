/// @description Slider event

// Inherit the parent event
event_inherited();

global.sfx_volume = value;
audio_group_set_gain(audiogroup_sound_effects, global.sfx_volume, 0);