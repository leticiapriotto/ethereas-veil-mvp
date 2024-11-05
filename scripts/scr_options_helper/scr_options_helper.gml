// Option Helper
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
    update_chatterbox();
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

// Options Draw
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
