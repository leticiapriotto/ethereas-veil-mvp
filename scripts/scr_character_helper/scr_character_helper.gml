// Character Setup
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
            _speech_bubble = spr_speech_bubble_light_bg;
            break;
        default:
            _character_x = room_width / 2;
            _speech_bubble = noone; 
            break;
    }

    return [_sprite, _character_x, _character_y, _speech_bubble];
}

// Character Drawing 
function draw_character(_character) {
    var _character_data = get_character_data(_character);
    var _sprite = _character_data[0];
    var _character_x = _character_data[1];
    var _character_y = _character_data[2];

    if (_sprite != noone) {
        draw_sprite(_sprite, image_index, _character_x, _character_y);
    }
}