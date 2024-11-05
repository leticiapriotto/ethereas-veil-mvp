// Character Setup
function get_character_data(_character) {
    var _character_data = {};

    switch (_character) {
        case "Lira":
            _character_data = {
                sprite: spr_chaos,
                sprite_x: 3 * room_width / 4,
                sprite_y: room_height,
                speech_bubble: spr_speech_bubble_dark_bg,
                text_x: 150,
                text_y: 125,
                text_width: 750,
                text_color: c_white
            };
            break;

        case "Player":
            _character_data = {
                sprite: noone,
                sprite_x: room_width,
                sprite_y: room_height,
                speech_bubble: spr_speech_bubble_light_bg,
                text_x: 150,
                text_y: 240,
                text_width: 600,
                text_color: c_black
            };
            break;

        default:
            _character_data = {
                sprite: noone,
                sprite_x: room_width,
                sprite_y: room_height,
                speech_bubble: noone,
                text_x: 150,
                text_y: 100,
                text_width: 640,
                text_color: c_black
            };
            break;
    }

    return _character_data;
}

// Character Drawing 
function draw_character(_character) {
    var _character_data = get_character_data(_character);
    var _sprite = _character_data.sprite; 

    if (_sprite != noone) {
        draw_sprite(_sprite, image_index, _character_data.sprite_x, _character_data.sprite_y);
    }
}