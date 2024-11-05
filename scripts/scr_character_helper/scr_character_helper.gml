// Character Setup
function get_character_data(_character) {
    var _character_y = room_height;
    var _character_x = room_width;
    var _speech_bubble;
    var _sprite = noone; 
    var _text_x = 150;
    var _text_y = 0;
	var _text_width = 640;
    var _text_color = c_white; 

    switch (_character) {
        case "Lira":
            _character_x = 3 * room_width / 4;
            _sprite = spr_chaos;
            _speech_bubble = spr_speech_bubble_dark_bg; 
            _text_y = 125;
			_text_width = 750;
            _text_color = c_white;  // Cor específica para Lira
            break;
        case "Player":
            _speech_bubble = spr_speech_bubble_light_bg;
            _text_y = 240;
			_text_width = 600;
            _text_color = c_black;  
            break;
        default:
            _speech_bubble = noone; 
            break;
    }

    return [_sprite, _character_x, _character_y, _speech_bubble, _text_x, _text_y, _text_width, _text_color];
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