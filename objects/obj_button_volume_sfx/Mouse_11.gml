/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

// Evento mouse leave em obj_button_music
if (instance_exists(obj_slider_music)) {
    with (obj_slider_music) {
        instance_destroy();
    }
}
