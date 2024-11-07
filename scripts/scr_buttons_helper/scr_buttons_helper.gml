/// @description Função para criar botões centralizados
function create_buttons(_buttons, _x_center_ratio) {
    var _center_x = display_get_width() * _x_center_ratio; 
    var _base_y = display_get_height() * 0.5; 

    // Calcula o espaçamento entre os botões com base na altura da tela
    var _spacing = display_get_height() * 0.1; // 10% da altura da tela como espaçamento entre botões

    // Distribui os botões centralizando o do meio e espaçando os outros acima e abaixo
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        var _y = _base_y + ((_i - (array_length(_buttons) - 1) / 2) * _spacing);
        instance_create_layer(_center_x, _y, "Instances_Buttons", _buttons[_i]);
    }
}

// Função para atualizar a posição dos botões com parallax
function update_buttons_position(_buttons, _camera_x, _parallax_speed) {
    var _center_x = display_get_width() * 0.5; 
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        _buttons[_i].x = _center_x - (_camera_x * _parallax_speed);
    }
}

// Script para atualizar os textos dos botões
function update_button_texts() {
    var _all_buttons = array_concat(global.menu_buttons, global.options_buttons);
    for (var _i = 0; _i < array_length(_all_buttons); _i++) {
        var _button = _all_buttons[_i];
        
        // Verifica se a instância ainda existe antes de acessar o button_text
        if (instance_exists(_button)) {
            // Atualiza o texto do botão Fullscreen com o valor atual de global.text_on_off
            if (_button == obj_button_fullscreen) {
                _button.button_text = "Fullscreen: " + global.text_on_off;
            } else {
                _button.button_text = global.texts[global.current_language][_button.button_index];
            }
        }
    }
}

// Função para remover botões
function remove_buttons(_buttons) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        instance_destroy(_buttons[_i]);
    }
}

function check_esc_pressed() {
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

