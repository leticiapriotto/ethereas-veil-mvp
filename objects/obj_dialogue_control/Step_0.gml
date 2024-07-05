/// @description handle user input for option

option_count = ChatterboxGetOptionCount(chatterbox); // get the number of dialogue options

// loop through each option
for (var _i = 0; _i < option_count; _i++) {
    
    if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
        var _option_x = option_x_positions[_i]; 

        // check if the mouse is over the option area
        if (mouse_x >= _option_x - 50 && mouse_x <= _option_x + 50 && mouse_y >= option_y_position - 15 && mouse_y <= option_y_position + 15) {
            option_index = _i; // Set the current option index for selection

            if (mouse_check_button_pressed(mb_left)) {
                ChatterboxSelect(chatterbox, option_index); // select this option in chatterbox
                chatterbox_update(); 
            }
        }
    }
}

// continue in chatterbox if waiting for player interaction
if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
    ChatterboxContinue(chatterbox);
    chatterbox_update(); 
}
