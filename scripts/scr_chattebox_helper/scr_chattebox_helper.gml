// Chatterbox Management
function initialize_chatterbox() {
    ChatterboxLoadFromFile("test.yarn");
    chatterbox = ChatterboxCreate();
    ChatterboxJump(chatterbox, "Intro");
}

function update_chatterbox() {
    text = ChatterboxGetContent(chatterbox, 0);
    character = ChatterboxGetContentSpeaker(chatterbox, 0);
    node_title = ChatterboxGetCurrent(chatterbox);
}

function continue_chatterbox_dialogue() {
    if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
        ChatterboxContinue(chatterbox);
        update_chatterbox();
    }
}

// Text Formatting
function wrap_text_in_chatterbox(x, y, _text, _line_spacing, _text_width) {
    draw_text_ext(x, y, _text, _line_spacing, _text_width);
}

function strip_character_name_from_text(_text, _character) {
    if (string_starts_with(_text, _character + ": ")) {
        _text = string_delete(_text, 1, string_length(_character) + 2);
    }
    return _text;
}

// Draw Dialogue
function draw_dialogue() {
    if (IsChatterbox(chatterbox) && text != undefined) {
        text = strip_character_name_from_text(text, character);

        var _character_data = get_character_data(character);
        var _speech_bubble = _character_data[3];

        if (_speech_bubble != noone) {
            var _bubble_x = 100;
            var _bubble_y = 50; 
            draw_sprite(_speech_bubble, 0, _bubble_x, _bubble_y);
        }

        draw_set_color(c_white);
        show_debug_message(text_width);
        
        draw_set_valign(fa_middle);
        draw_set_halign(fa_left);
        
        wrap_text_in_chatterbox(150, 125, text, line_spacing, 750);
    }
}