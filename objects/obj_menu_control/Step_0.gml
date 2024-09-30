/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Step Event do obj_menu_control
var _cam_x = camera_get_view_x(view_camera[0]);
var _button_parallax_speed = -1;
var _center_x = room_width / 2;

if (global.show_options) {
	destroy_buttons(menu_buttons);
    draw_buttons(options_buttons, _center_x);
    update_buttons(options_buttons, _cam_x, _button_parallax_speed);
	
} else {
	destroy_buttons(options_buttons);
    draw_buttons(menu_buttons, _center_x);
    update_buttons(menu_buttons, _cam_x, _button_parallax_speed);
}
