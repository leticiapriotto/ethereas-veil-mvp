/// @description text and options display

// set font for drawing text
draw_set_font(fnt_segoe_ui);

// check if Chatterbox is active and if there is text to display
if (IsChatterbox(chatterbox) && text != undefined) {
    
    // remove character name from text, wrap and draw the text
    text = remove_character_name_from_text(text, character);
    chatterbox_wrap_text(text_x, text_y, text, line_spacing, text_width);

    // draw options if they exist
    if (option_count > 0) {
        for (var _i = 0; _i < option_count; _i++) {
            
            if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
                var _option_text = ChatterboxGetOption(chatterbox, _i);

                // draw card sprites
				draw_set_alpha((option_index == _i) ? 0.5 : 1); 
				draw_card_sprites(node_title, _i, sprite_x_positions[_i], sprite_y_position);
				draw_set_alpha(1);

                // draw option
                //draw_text(option_x_positions[_i], option_y_position, _option_text);
            }
        }
    }

    // draw current character sprite
    draw_character_sprite(character);
	
}

// check mouse hover and draws card description
if (mouse_over_option && option_index != -1) {
    var _description = "";
    
    switch (node_title) {
        case "First Decision":
            _description = first_decision_descriptions[option_index];
            break;
        case "Second Decision":
            _description = second_decision_descriptions[option_index];
            break;
        case "Third Decision":
            _description = third_decision_descriptions[option_index];
            break;
    }
	
	chatterbox_wrap_text(text_x, 650, _description, line_spacing, text_width);
	//chatterbox_wrap_text(mouse_x, mouse_y, _description, line_spacing, text_width);
	
}
