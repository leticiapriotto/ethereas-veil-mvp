// setup
function set_cards_positions() {
	var _sprite_y_position = room_height / 2;
    var _sprite_x_positions = [
        room_width / 4,
        room_width / 2,
        3 * room_width / 4
    ];
	
	return {sprite_y_position: _sprite_y_position,
			sprite_x_positions: _sprite_x_positions
	};
}
	
function set_scale_lists(_index) {
    if (!variable_instance_exists(id, "scale_x_list")) {
        scale_x_list = [];
        scale_y_list = [];
    }

    // Define a escala inicial para o índice se ainda não existir
    if (array_length(scale_x_list) <= _index) {
        scale_x_list[_index] = 1.0;
        scale_y_list[_index] = 1.0;
    }
}

function set_card_descriptions() {
    first_decision_descriptions = [
        "The High Priestess - Description for the High Priestess card.",
        "The Lovers - Description for the Lovers card.",
        "Death - Description for the Death card."
    ];

    second_decision_descriptions = [
        "The Fool - Description for the Fool card.",
        "The Emperor - Description for the Emperor card.",
        "Strength - Description for the Strength card."
    ];

    third_decision_descriptions = [
        "The Tower - Description for the Tower card.",
        "The Devil - Description for the Devil card.",
        "Justice - Description for the Justice card."
    ];
}
	
function get_sprite_list(_node_title) {
	var _first_decision_sprites = [spr_card_order_1, spr_card_chaos_5, spr_card_sun_4];
    var _second_decision_sprites = [spr_card_sun_4, spr_card_moon_2, spr_card_world_3];
    var _third_decision_sprites = [spr_card_order_1, spr_card_world_3, spr_card_chaos_5];
	
    switch (_node_title) {
        case "D1":
            return _first_decision_sprites;
        case "D2":
            return _second_decision_sprites;
        case "D3":
            return _third_decision_sprites;
        case "D4":
            return _third_decision_sprites;
        case "D5":
            return _third_decision_sprites;
        case "D6":
            return _third_decision_sprites;
        default:
            return undefined;
    }
}
	
function get_card_description(_node_title, _index) {
switch (_node_title) {
    case "D1":
        return first_decision_descriptions[_index];
    case "D2":
        return second_decision_descriptions[_index];
    case "D3":
        return third_decision_descriptions[_index];
    case "D4":
        return third_decision_descriptions[_index];
    case "D5":
        return third_decision_descriptions[_index];
    case "D6":
        return third_decision_descriptions[_index];
    default:
        return "";
}
}

// draw
function draw_card_sprites(_node_title, _index, x, y) {
    var _sprite_list = get_sprite_list(_node_title);

    if (_sprite_list != undefined && _sprite_list[_index] != undefined) {

        set_scale_lists(_index); 
        update_card_scale(_index);

        draw_set_alpha(1);
        draw_sprite_ext(_sprite_list[_index], 0, x, y, scale_x_list[_index], scale_y_list[_index], 0, c_white, 1);
    }
}

function draw_card_description() {
    if (mouse_over_option && option_index != -1) {
	
        var _description = get_card_description(node_title, option_index);
        var _config = configure_character_dialogue(undefined);

        draw_text_ext(_config.text_x, _config.text_y, _description, 40,_config.text_width);
    }
}
	
// update
function update_card_scale(_index) {
    var _target_scale = (option_index == _index && mouse_over_option) ? 1.2 : 1.0;
    scale_x_list[_index] = lerp(scale_x_list[_index], _target_scale, 0.1);
    scale_y_list[_index] = lerp(scale_y_list[_index], _target_scale, 0.1);
}
