/// @description return to menu

// Inherit the parent event
event_inherited();

if (global.current_language == 0) {
    global.current_language = 1;
    update_button_texts();
} else if (global.current_language == 1) {
    global.current_language = 0;
    update_button_texts();
}
