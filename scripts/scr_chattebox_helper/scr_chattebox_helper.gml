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
        var _text_x = _character_data[4];
        var _text_y = _character_data[5]; 

        if (_speech_bubble != noone) {
            var _bubble_x = 100;
            var _bubble_y = 50; 
            var _total_frames = sprite_get_number(_speech_bubble);
            draw_sprite(_speech_bubble, speech_bubble_frame, _bubble_x, _bubble_y);
         
            // Aumenta o contador de tempo
            frame_timer++;
            if (frame_timer >= frame_interval) {
                // Atualiza o frame da bolha de fala
                speech_bubble_frame++;
                if (speech_bubble_frame >= _total_frames) {
                    speech_bubble_frame = 0; 
                }
                // Reseta o timer
                frame_timer = 0;
            }
        }

        draw_set_color(c_white);
        show_debug_message(text_width);
        
        draw_set_valign(fa_middle);
        draw_set_halign(fa_left);
        
        wrap_text_in_chatterbox(_text_x, _text_y, text, line_spacing, 750);
    }
}