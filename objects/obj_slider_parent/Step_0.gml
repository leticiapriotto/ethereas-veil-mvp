/// @description Check for no longer selected
if mouse_check_button_pressed(mb_left) {
    var _button_x = x + sprite_width * value;
    var _button_y = y;
    var _button_radius = sprite_get_width(spr_slider_button_bg) / 2;
    if point_in_circle(mouse_x, mouse_y, _button_x, _button_y, _button_radius) {
        selected = true;
    }
}

if !mouse_check_button(mb_left) {
    selected = false;
}

if selected {
    value = clamp((mouse_x - x) / sprite_width, 0, max_value);
    event_user(0);
}