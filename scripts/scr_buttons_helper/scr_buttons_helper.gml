// setup
function set_button_groups() {
	var _menu_buttons = [
		obj_button_new_game, 
		obj_button_options, 
		obj_button_exit
	];

	var _options_buttons = [
		obj_button_volume_music,
		obj_button_volume_sound_effects, 
		obj_button_language,
		obj_button_fullscreen,
		obj_button_return
	];

	return {menu_buttons: _menu_buttons, options_buttons: _options_buttons};
}

// create
function create_buttons(_buttons) {
    var _center_x = display_get_width() * (room_width / 2); 
    var _base_y = display_get_height() * 0.5; 
    var _spacing = display_get_height() * 0.1; 

    // distribute buttons by centering the middle and spacing the others above and below
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        var _y = _base_y + ((_i - (array_length(_buttons) - 1) / 2) * _spacing);
        instance_create_layer(_center_x, _y, "Instances_Buttons", _buttons[_i]);
    }
}

// update positions because parallax
function update_buttons_position(_buttons, _camera_x, _parallax_speed) {
    var _center_x = display_get_width() * 0.5; 
	
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        _buttons[_i].x = _center_x - (_camera_x * _parallax_speed);
    }
}

// update positions because language
function update_button_texts() {
	var _buttons = set_button_groups();
    var _all_buttons = array_concat(_buttons.menu_buttons, _buttons.options_buttons);
	
    for (var _i = 0; _i < array_length(_all_buttons); _i++) {
        var _button = _all_buttons[_i];
        
        if (instance_exists(_button)) {
            if (_button == obj_button_fullscreen) {
                _button.button_text = "Fullscreen: " + global.text_on_off;
            } else {
                _button.button_text = global.texts[global.current_language][_button.button_index];
            }
        }
    }
}

// remove
function remove_buttons(_buttons) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        instance_destroy(_buttons[_i]);
    }
}

// verify fullscreen condition
function change_fullscreen_button_text() {
	if (keyboard_check_pressed(vk_escape) && (global.fullscreen = true)) {
		window_set_fullscreen(false);
	    global.fullscreen = false;
		global.text_on_off = "OFF";
		update_button_texts();
		
	} else if (keyboard_check_pressed(vk_escape) && (global.fullscreen = false)) {
		window_set_fullscreen(true);
	    global.fullscreen = true;
		global.text_on_off = "ON";
		update_button_texts();
	}
}