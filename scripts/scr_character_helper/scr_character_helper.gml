// Character Setup
function get_character_data(_character) {
    var _character_data = {};

    switch (_character) {
        case "Neriah":
            _character_data = {
                sprite: spr_chaos,
                sprite_x: 3 * room_width / 4,
                sprite_y: room_height
            };
            break;

        case "Player":
            _character_data = {
                sprite: noone,
                sprite_x: room_width,
                sprite_y: room_height
            };
            break;

        default:
            _character_data = {
                sprite: noone,
                sprite_x: room_width,
                sprite_y: room_height
            };
            break;
    }

    return _character_data;
}
	
// Character Dialogue Configuration
function configure_character_dialogue(_character) {
    // Começa com a configuração padrão
    var _config = get_default_text_position();

    // Ajusta as configurações com base no personagem e na bolha
    switch (_character) {
        case "Neriah":
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
            _config.text_x = 150;
            _config.text_y = 125;
            _config.text_width = 750;
            _config.text_color = c_white;
            _config.speech_bubble = spr_speech_bubble_dark_bg;
            break;

        case "Player":
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
            _config.text_x = 150;
            _config.text_y = 240;
            _config.text_width = 600;
            _config.text_color = c_black;
            _config.speech_bubble = spr_speech_bubble_light_bg;
            break;
			
		case "Void":
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
		    _config.text_x = room_width / 2;
            _config.text_y = 50;
            _config.text_width = 640;
            _config.text_color = c_black;
            _config.speech_bubble = noone;
            break;

        default:
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
            _config.text_x = room_width / 2;
            _config.text_y = 640;
            _config.text_width = 640;
            _config.text_color = c_black;
            _config.speech_bubble = noone;
            break;
    }

    return _config;
}

// Character Drawing 
function draw_character(_character) {
    var _character_data = get_character_data(_character);
    var _sprite = _character_data.sprite; 

    if (_sprite != noone) {
        draw_sprite(_sprite, image_index, _character_data.sprite_x, _character_data.sprite_y);
    }
}