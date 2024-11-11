/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

var _sprite_x = sprite_get_width(spr_slider_bar_bg) / 2;

// Evento mouse enter em obj_button_music
if (!instance_exists(obj_slider_music)) {
    instance_create_layer(x - _sprite_x, y, "Instances_Buttons", obj_slider_music);
}
