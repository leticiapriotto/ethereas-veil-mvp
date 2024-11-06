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

// Função para remover botões
function remove_buttons(_buttons) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        instance_destroy(_buttons[_i]);
    }
}
