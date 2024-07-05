/// @description text and options display

// set font and alignment for drawing text
draw_set_font(fnt_segoe_ui);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

// check if chatterbox is active and if there is text to display
if (IsChatterbox(chatterbox) && text != undefined) {
    var _text_y = 150; 
    var _text_width = room_width * 0.8
    var _line_spacing = 50; 
    
    draw_text_ext(room_width / 2, _text_y, text, _line_spacing, _text_width);
    
    // draw options if they exist
    if (option_count > 0) {
        for (var _i = 0; _i < option_count; _i++) {
            
			// check if the condition for this option is true
            if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
                var _option_x = _option_x_positions[_i]; 
                var _option_y = room_height / 2; 
                var _icon_prefix = (option_index == _i) ? "> " : ""; 
                var _option_text = ChatterboxGetOption(chatterbox, _i);
                
                draw_text(_option_x, _option_y, _icon_prefix + _option_text);
            }
        }
    }
}
