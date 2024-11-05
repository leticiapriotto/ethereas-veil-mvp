// sprites.js
function draw_card_sprites(_node_title, _index, x, y) {
    var _sprite_list = get_sprite_list(_node_title);

    if (_sprite_list != undefined && _sprite_list[_index] != undefined) {
        if (!variable_instance_exists(id, "scale_x_list")) {
            scale_x_list = [];
            scale_y_list = [];
        }

        if (array_length(scale_x_list) <= _index) {
            scale_x_list[_index] = 1.0;
            scale_y_list[_index] = 1.0;
        }

        var target_scale = (option_index == _index && mouse_over_option) ? 1.2 : 1.0;
        scale_x_list[_index] = lerp(scale_x_list[_index], target_scale, 0.1);
        scale_y_list[_index] = lerp(scale_y_list[_index], target_scale, 0.1);

        draw_sprite_ext(_sprite_list[_index], 0, x, y, scale_x_list[_index], scale_y_list[_index], 0, c_white, 1);
    }
}

function get_character_data(_character) {
    var _character_y = room_height;
    var _character_x;
    var _speech_bubble;
    var _sprite = noone; 

    switch (_character) {
        case "Lira":
            _character_x = 3 * room_width / 4;
            _sprite = spr_chaos;
            _speech_bubble = spr_speech_bubble_dark_bg; 
            break;
        case "Player":
            _character_x = room_width / 4;
            _sprite = spr_soul;
            _speech_bubble = spr_speech_bubble_light_bg;
            break;
        default:
            _character_x = room_width / 2;
            _speech_bubble = noone; 
            break;
    }

    return [_sprite, _character_x, _character_y, _speech_bubble];
}


function draw_character_sprite(_character) {
    var _character_data = get_character_data(_character);
    var _sprite = _character_data[0];
    var _character_x = _character_data[1];
    var _character_y = _character_data[2];

    if (_sprite != noone) {
        draw_sprite(_sprite, image_index, _character_x, _character_y);
    }
}
