/// @description create, update and remove

// setup
var _cam_x = camera_get_view_x(view_camera[0]);
var _button_parallax_speed = -1;
var _menu_buttons = button_groups.menu_buttons;
var _options_buttons = button_groups.options_buttons;

// create options menu
if (global.show_options) {
    remove_buttons(_menu_buttons);
    create_buttons(_options_buttons);
    update_buttons_position(_options_buttons, _cam_x, _button_parallax_speed);

// create menu menu	
} else if (!global.show_options) {
    remove_buttons(_options_buttons);
    create_buttons(_menu_buttons);
    update_buttons_position(_menu_buttons, _cam_x, _button_parallax_speed);
}

// verify fullscreen state
change_fullscreen_button_text();
