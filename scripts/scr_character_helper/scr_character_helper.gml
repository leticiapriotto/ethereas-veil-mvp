// Character Setup
function get_character_data(_character) {
    var _character_y = room_height;
    var _character_x;
    var _speech_bubble;
    var _sprite = noone; 
    var _text_x;
    var _text_y;

    switch (_character) {
        case "Lira":
            _character_x = 3 * room_width / 4;
            _sprite = spr_chaos;
            _speech_bubble = spr_speech_bubble_dark_bg; 
            _text_x = 150;
            _text_y = 125;
            break;
        case "Player":
            _character_x = room_width / 4;
            _speech_bubble = spr_speech_bubble_light_bg;
            _text_x = 150;
            _text_y = 240;
            break;
        default:
            _character_x = room_width / 2;
            _speech_bubble = noone; 
            _text_x = room_width / 2; 
            _text_y = room_height / 2; 
            break;
    }

    return [_sprite, _character_x, _character_y, _speech_bubble, _text_x, _text_y];
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