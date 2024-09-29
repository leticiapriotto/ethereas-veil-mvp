// step event
/// @description handle user input for option

option_count = ChatterboxGetOptionCount(chatterbox); // get the number of dialogue options
mouse_over_option = false;

for (var _i = 0; _i < option_count; _i++) {
    
    if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {

        // use sprite dimensions to check mouse over
        var _sprite_width = sprite_get_width(first_decision_sprites[_i]);
        var _sprite_height = sprite_get_height(first_decision_sprites[_i]);
        var _sprite_x = sprite_x_positions[_i] - _sprite_width / 2; // middle center
        var _sprite_y = sprite_y_position - _sprite_height / 2;

        // check if the mouse is over the option area (using sprite dimensions)
        if (mouse_x >= _sprite_x && mouse_x <= _sprite_x + _sprite_width &&
            mouse_y >= _sprite_y && mouse_y <= _sprite_y + _sprite_height) {
            option_index = _i; // set the current option index for selection
            mouse_over_option = true;

            if (mouse_check_button_pressed(mb_left)) {
                ChatterboxSelect(chatterbox, option_index); // select this option in Chatterbox
                chatterbox_update(); 
            }
        }
    }
}

// if no option is hovered, set option_index to -1
if (!mouse_over_option) {
    option_index = -1;
}

// continue in Chatterbox if waiting for player interaction
if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
    ChatterboxContinue(chatterbox);
    chatterbox_update(); 
}
