// Text Formatting
function wrap_text_in_chatterbox(x, y, _text, _line_spacing, _text_width) {
	scribble(_text).wrap(_text_width).draw(x, y, typist);
    //draw_text_ext(x, y, _text, _line_spacing, _text_width);
}

function strip_character_name_from_text(_text, _character) {
    if (string_starts_with(_text, _character + ": ")) {
        _text = string_delete(_text, 1, string_length(_character) + 2);
    }
    return _text;
}
	
function get_default_text_position() {
    return {
        text_x: 150,
        text_y: 100,
        text_width: 640,
        text_color: c_black,
        speech_bubble: noone
    };
}

// Draw Dialogue
function draw_dialogue() {
    if (IsChatterbox(chatterbox) && text != undefined) {
        text = strip_character_name_from_text(text, character);
        var _config = configure_character_dialogue(character);

        // Desenha a bolha de fala, se o personagem tiver uma
        if (option_count == 0 && _config.speech_bubble != noone) {
            draw_speech_bubble(_config.speech_bubble, _config.text_x, _config.text_y);
        }

        // Configura o texto e o desenha usando as propriedades específicas do personagem
        draw_set_color(_config.text_color);
        wrap_text_in_chatterbox(_config.text_x, _config.text_y, text, line_spacing, _config.text_width);
    }
}

// Draw Speech Bubble
function draw_speech_bubble(_speech_bubble, _bubble_x, _bubble_y) {
    
    if (_speech_bubble == spr_speech_bubble_dark_bg) {
        _bubble_x = _bubble_x - 75;
        _bubble_y = _bubble_y - 75;
    } 
	
	if (_speech_bubble == spr_speech_bubble_light_bg) {
	    _bubble_x = _bubble_x - 75; 
	    _bubble_y = _bubble_y + 175; 
	}
    
    var _total_frames = sprite_get_number(_speech_bubble);
    
    draw_sprite(_speech_bubble, speech_bubble_frame, _bubble_x, _bubble_y);

    // Atualiza o frame da bolha de fala
    frame_timer++;
    if (frame_timer >= frame_interval) {
        speech_bubble_frame = (speech_bubble_frame + 1) % _total_frames;
        frame_timer = 0;
    }
}
