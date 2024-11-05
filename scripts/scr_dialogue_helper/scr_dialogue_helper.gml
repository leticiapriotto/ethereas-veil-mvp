// text_formatting
function chatterbox_wrap_text(x, y, _text, _line_spacing, _text_width) {
    draw_text_ext(x, y, _text, _line_spacing, _text_width);
}

function remove_character_name_from_text(_text, _character) {
    if (string_starts_with(_text, _character + ": ")) {
        _text = string_delete(_text, 1, string_length(_character) + 2);
    }
    return _text;
}

// option handling
function update_option_selection() {
    option_count = ChatterboxGetOptionCount(chatterbox); 
    mouse_over_option = false;

    for (var _i = 0; _i < option_count; _i++) {
        if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
            if (is_mouse_over_option(_i)) {
                option_index = _i;
                mouse_over_option = true;

                if (mouse_check_button_pressed(mb_left)) {
                    select_option(_i);
                }
            }
        }
    }

    if (!mouse_over_option) {
        option_index = -1;
    }
}

function select_option(_index) {
    ChatterboxSelect(chatterbox, _index);
    chatterbox_update();
}

function is_mouse_over_option(_index) {
    var _sprite_list = get_sprite_list(node_title);
    var _sprite_width = sprite_get_width(_sprite_list[_index]);
    var _sprite_height = sprite_get_height(_sprite_list[_index]);
    var _sprite_x = sprite_x_positions[_index] - _sprite_width / 2;
    var _sprite_y = sprite_y_position - _sprite_height / 2;

    return mouse_x >= _sprite_x && mouse_x <= _sprite_x + _sprite_width &&
           mouse_y >= _sprite_y && mouse_y <= _sprite_y + _sprite_height;
}

function continue_dialogue() {
    if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
        ChatterboxContinue(chatterbox);
        chatterbox_update();
    }
}

// Dialogue and options drawing
function draw_dialogue_text() {
    if (IsChatterbox(chatterbox) && text != undefined) {
        text = remove_character_name_from_text(text, character);

        var _character_data = get_character_data(character);
        var _speech_bubble = _character_data[3];

        if (_speech_bubble != noone) {
            var _bubble_x = 100;
            var _bubble_y = 50; 
            draw_sprite(_speech_bubble, 0, _bubble_x, _bubble_y); // Desenha a bolha normalmente
        }

        draw_set_color(c_white);
		show_debug_message(text_width);
		
		draw_set_valign(fa_middle);
	    draw_set_halign(fa_left);
		
        chatterbox_wrap_text(150, 125, text, line_spacing, 750);
    }
}

function draw_options() {
    if (option_count > 0) {
        for (var _i = 0; _i < option_count; _i++) {
            if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
                var _option_text = ChatterboxGetOption(chatterbox, _i);

                draw_set_alpha((option_index == _i) ? 0.5 : 1);
                draw_card_sprites(node_title, _i, sprite_x_positions[_i], sprite_y_position);
                draw_set_alpha(1);
            }
        }
    }
}

function draw_card_description() {
    if (mouse_over_option && option_index != -1) {
        var _description = get_card_description(node_title, option_index);
        chatterbox_wrap_text(text_x, 650, _description, line_spacing, text_width);
    }
}

function get_card_description(_node_title, _index) {
    switch (_node_title) {
        case "First Decision":
            return first_decision_descriptions[_index];
        case "Second Decision":
            return second_decision_descriptions[_index];
        case "Third Decision":
            return third_decision_descriptions[_index];
        default:
            return "";
    }
}
