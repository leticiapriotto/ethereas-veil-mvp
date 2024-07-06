//chattebox
function chatterbox_init() {
	ChatterboxLoadFromFile("test.yarn");
	chatterbox = ChatterboxCreate();
	ChatterboxJump(chatterbox, "Intro");
}

function chatterbox_update() {
    text = ChatterboxGetContent(chatterbox, 0);
    character = ChatterboxGetContentSpeaker(chatterbox, 0);
    node_title = ChatterboxGetCurrent(chatterbox);
}

//text formating
function chatterbox_wrap_text(x, y, _text, _line_spacing, _text_width) {
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text_ext(x, y, _text, _line_spacing, _text_width);
}

function remove_character_name_from_text(_text, _character) {
	if (string_starts_with(_text, _character + ": ")) {
		_text = string_delete(_text, 1, string_length(_character) + 2);
	}
	return _text;
}

//draw sprites
function set_cards_lists_and_position() {
	sprite_y_position = 300;
	sprite_x_positions = [
	    room_width / 4,
	    room_width / 2,
	    3 * room_width / 4
	];
	
	first_decision_sprites = [spr_card_the_high_priestess, spr_card_the_lovers, spr_card_death];
	second_decision_sprites = [spr_card_the_fool, spr_card_the_emperor, spr_card_strength];
	third_decision_sprites = [spr_card_the_tower, spr_card_the_devil, spr_card_justice];
}

function set_cards_descriptions() {
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

function draw_character_sprite(_character) {
    var _character_y = 700;
    var _character_right_x = 3 * room_width / 4;
	var _character_center_x =  room_width / 2;
	var _character_left_x = room_width / 4;

    switch (_character) {
        case "Soul":
            draw_sprite(spr_soul, 0, _character_right_x, _character_y);
            break;
        case "Chaos":
            draw_sprite(spr_chaos, 0, _character_left_x, _character_y);
            break;
    
    }
}

function draw_card_sprites(_node_title, _index, x, y) {
    var _sprite_list = undefined;
	
	

    switch (_node_title) {
        case "First Decision":
            _sprite_list = first_decision_sprites;
            break;
        case "Second Decision":
            _sprite_list = second_decision_sprites;
            break;
        case "Third Decision":
            _sprite_list = third_decision_sprites;
            break;
    }

    if (_sprite_list != undefined && _sprite_list[_index] != undefined) {
        draw_sprite(_sprite_list[_index], 0, x, y);
    }
}


