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
			
        case "Gael":
            _character_data = {
                sprite: spr_char_gael,
                sprite_x: 3 * room_width / 4,
                sprite_y: room_height
            };
            break;
			
        case "Gideon":
            _character_data = {
                sprite: spr_char_gideon,
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
    var _config = get_default_text_position();

    switch (_character) {
        case "Neriah":
            _config.text_x = 200;
            _config.text_y = 200;
            _config.text_width = 1100;
            _config.speech_bubble = spr_speech_bubble_dark_bg;
            break;
			
        case "Gael":
            _config.text_x = 200;
            _config.text_y = 200;
            _config.text_width = 1100;
            _config.speech_bubble = spr_speech_bubble_dark_bg;
            break;
			
        case "Gideon":
            _config.text_x = 200;
            _config.text_y = 200;
            _config.text_width = 1100;
            _config.speech_bubble = spr_speech_bubble_dark_bg;
            break;

        case "Player":
            _config.text_x = 150;
            _config.text_y = 775;
            _config.text_width = 900;
            _config.speech_bubble = spr_speech_bubble_light_bg;
            break;
			
		case "Title":
		    _config.text_x = room_width / 2;
            _config.text_y = 125;
            _config.text_width = 1000;
            _config.speech_bubble = noone;
            break;

        default:
			draw_set_halign(fa_left)
            _config.text_x = 100;
            _config.text_y = 1000;
            _config.text_width = 1000;
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
 
function draw_char_gael(_is_gael_here) {
    if (_is_gael_here == true) { 
        var _character_data = get_character_data("Gael");
        var _sprite = _character_data.sprite;
        
        if (_sprite != noone) {
            draw_sprite(_sprite, image_index, _character_data.sprite_x, _character_data.sprite_y);
        }
    }
}

function draw_char_gideon(_is_gideon_here) {
    if (_is_gideon_here == true) { 
        var _character_data = get_character_data("Gideon");
        var _sprite = _character_data.sprite;
        
        if (_sprite != noone) {
            draw_sprite(_sprite, image_index, _character_data.sprite_x, _character_data.sprite_y);
        }
    }
}

function delete_char_neriah() {
    var _character_data = get_character_data("Neriah"); // Acesse o dado do personagem
    _character_data.sprite = noone; // Apaga o personagem ao definir o sprite como "noone"
}

function delete_char_gael() {
    var _character_data = get_character_data("Gael"); // Acesse o dado do personagem
    _character_data.sprite = noone; // Apaga o personagem ao definir o sprite como "noone"
}

function delete_char_gideon() {
    var _character_data = get_character_data("Gideon"); // Acesse o dado do personagem
    _character_data.sprite = noone; // Apaga o personagem ao definir o sprite como "noone"
}
