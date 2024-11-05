// text_formatting.js
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
