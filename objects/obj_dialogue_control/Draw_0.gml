/// @description text and options display

// set font for drawing text
draw_set_font(fnt_segoe_ui);

// check if chatterbox is active and if there is text to display
if (IsChatterbox(chatterbox) && text != undefined) {
    
	// remove character name from text, wrap and draw the text
	text = remove_character_name_from_text(text, character);
    chatterbox_wrap_text(screen_middle_x, screen_top_y, text, line_spacing, text_width);

    // draw options if they exist
    if (option_count > 0) {
        for (var _i = 0; _i < option_count; _i++) {
            
            if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
               
                var _option_text = ChatterboxGetOption(chatterbox, _i);
				
				// draw card sprites and options text
                draw_card_sprites(node_title, _i, option_x_positions[_i], option_y_position - 300);
				
				// transparency for selected option
                draw_set_alpha((option_index == _i) ? 0.5 : 1);
                draw_text(option_x_positions[_i], option_y_position, _option_text);
				draw_set_alpha(1);
			
            }
        } 
		
    }

    // draw current character sprite
    draw_character_sprite(character);
}