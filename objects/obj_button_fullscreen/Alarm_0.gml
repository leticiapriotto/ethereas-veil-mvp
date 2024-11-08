/// @description return to menu

// Inherit the parent event
event_inherited();

if (global.fullscreen == false) {
    window_set_fullscreen(true);
    global.fullscreen = true;
    global.text_on_off = "ON";
	
} else {
    window_set_fullscreen(false);
    global.fullscreen = false;  
    global.text_on_off = "OFF";
}

// Atualiza os textos dos botões após a alteração
update_button_texts();