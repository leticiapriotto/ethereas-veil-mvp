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
    global.card_data = [
        {sprite: spr_card_order_1, description: "A paz vem quando as peças se alinham."},
        {sprite: spr_card_moon_2, description: "A verdade é vista apenas à luz do mistério."},
        {sprite: spr_card_world_3, description: "O equilíbrio está na dança entre o fim e o começo."},
        {sprite: spr_card_sun_4, description: "A verdade é clara, mas seus raios podem queimar."},
        {sprite: spr_card_chaos_5, description: "Na destruição, nasce a possibilidade."}
    ];

    global.decisions_data = [
        [3, 2, 1],  // D1: Sol, Mundo, Lua
        [4, 3, 2],  // D2: Caos, Sol, Mundo
        [4, 1, 0],  // D3: Caos, Lua, Ordem
        [0, 4, 2],  // D4: Ordem, Caos, Mundo
        [3, 0, 2],  // D5: Sol, Ordem, Mundo
        [2, 4, 0]   // D6: Mundo, Caos, Ordem
    ];
}

function get_decision_sprites(_node_title) {
    var _decision_index = real(string_delete(_node_title, 1, 1)) - 1; // Converte "D1" para índice 0
    if (_decision_index >= 0 && _decision_index < array_length(global.decisions_data)) {
        var _sprites = [];
        var _cards = global.decisions_data[_decision_index];
        
        for (var _i = 0; _i < array_length(_cards); _i++) {
            _sprites[_i] = global.card_data[_cards[_i]].sprite;
        }
        
        return _sprites;
    }
    
    return undefined;
}

function get_card_description(_node_title, _index) {
    var _decision_index = real(string_delete(_node_title, 1, 1)) - 1; // Converte "D1" para índice 0
    if (_decision_index >= 0 && _decision_index < array_length(global.decisions_data)) {
        var _card_index = global.decisions_data[_decision_index][_index];
        return global.card_data[_card_index].description;
    }
    
    return "";
}

// draw
function draw_card_sprites(_node_title, _index, x, y) {
    var _sprite_list = get_decision_sprites(_node_title);

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
