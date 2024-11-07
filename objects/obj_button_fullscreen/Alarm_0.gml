/// @description return to menu

// Inherit the parent event
event_inherited();

if (global.fullscreen == false) {
    window_set_fullscreen(true);
    global.fullscreen = true; 
} else if (global.fullscreen == true) {
    window_set_fullscreen(false);
    global.fullscreen = false;  
}
