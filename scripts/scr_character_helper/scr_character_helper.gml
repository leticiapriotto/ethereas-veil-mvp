// Character Setup
function get_character_data(_character) {
    var _character_data = {};

    switch (_character) {
        case "Neriah":
            _character_data = {
                sprite: spr_char_neriah,
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
            _config.text_y = 200;
            _config.text_width = 1100;
            _config.text_color = c_white;
            _config.speech_bubble = spr_speech_bubble_dark_bg;
            break;

        case "Player":
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
            _config.text_x = 150;
            _config.text_y = 900;
            _config.text_width = 900;
            _config.text_color = c_black;
            _config.speech_bubble = spr_speech_bubble_light_bg;
            break;
			
		case "Void":
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
		    _config.text_x = room_width / 2;
            _config.text_y = 50;
            _config.text_width = 800;
            _config.text_color = c_black;
            _config.speech_bubble = noone;
            break;

        default:
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
            _config.text_x = room_width / 2;
            _config.text_y = 1000;
            _config.text_width = 800;
            _config.text_color = c_black;
            _config.speech_bubble = noone;
            break;
    }

    return _config;
}

// Character Drawing 
function draw_char_neriah(_is_neriah_here) {
    if (_is_neriah_here == true) { 
        var _character_data = get_character_data("Neriah");
        var _sprite = _character_data.sprite;
        
        if (_sprite != noone) {
            draw_sprite(_sprite, image_index, _character_data.sprite_x, _character_data.sprite_y);
        }
    }
}

function delete_character() {
    var _character_data = get_character_data("Neriah"); // Acesse o dado do personagem
    _character_data.sprite = noone; // Apaga o personagem ao definir o sprite como "noone"
}
