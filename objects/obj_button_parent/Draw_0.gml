/// @description button display

draw_self();

draw_set_font(fnt_elegant_typewriter_33);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _text_color = make_color_rgb(203, 204, 199)
draw_text_colour(x, y, button_text, _text_color, _text_color, _text_color, _text_color, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
