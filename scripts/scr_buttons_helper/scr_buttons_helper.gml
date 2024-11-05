// buttons.js
function draw_buttons(_buttons, x) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        instance_create_layer(x, 284 + (_i * 100), "Instances_Buttons", _buttons[_i]);
    }
}

function update_buttons(_buttons, _cam_x, _button_parallax_speed) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        _buttons[_i].x = 640 - (_cam_x * _button_parallax_speed);
    }
}

function destroy_buttons(_buttons) {
    for (var _i = 0; _i < array_length(_buttons); _i++) {
        instance_destroy(_buttons[_i]);
    }
}
