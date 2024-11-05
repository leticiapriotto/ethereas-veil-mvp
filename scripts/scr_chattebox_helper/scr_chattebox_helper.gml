// Chatterbox Management
function initialize_chatterbox() {
    ChatterboxLoadFromFile("test.yarn");
    chatterbox = ChatterboxCreate();
    ChatterboxJump(chatterbox, "Intro");
}

function update_chatterbox() {
    if (chatterbox != noone) { // Verifica se chatterbox foi inicializado
        text = ChatterboxGetContent(chatterbox, 0);
        character = ChatterboxGetContentSpeaker(chatterbox, 0);
        node_title = ChatterboxGetCurrent(chatterbox);

        // Verifica se chegou no nó "End Game" e troca a sala
        if (node_title == "End Game") { 
            room_goto(rm_splash_credits); // Transição para os créditos
        }
    }
}

function continue_chatterbox_dialogue() {
    if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
        ChatterboxContinue(chatterbox);
        update_chatterbox(); // Atualiza após continuar o diálogo
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
	
function configure_text(_color) {
    draw_set_color(_color);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
}

// Draw Dialogue
function draw_dialogue() {
    if (IsChatterbox(chatterbox) && text != undefined) {
        text = strip_character_name_from_text(text, character);
        
        // Recupera dados do personagem
        var _character_data = get_character_data(character);
        var _speech_bubble = _character_data.speech_bubble;
        var _text_x = _character_data.text_x; 
        var _text_y = _character_data.text_y;  
        var _text_width = _character_data.text_width;  
        var _text_color = _character_data.text_color; 
        
        // Desenha a bolha de fala e atualiza o frame da animação
        if (_speech_bubble != noone) {
            draw_speech_bubble(_speech_bubble);
        }

        // Configura e desenha o texto com a cor específica do personagem
        configure_text(_text_color);
        wrap_text_in_chatterbox(_text_x, _text_y, text, line_spacing, _text_width);
    }
}

//  Draw Speech Bubble
function draw_speech_bubble(_speech_bubble) {
    var _bubble_x = 100;
    var _bubble_y = 50;
    var _total_frames = sprite_get_number(_speech_bubble);
    
    draw_sprite(_speech_bubble, speech_bubble_frame, _bubble_x, _bubble_y);

    // Atualiza o frame da bolha de fala
    frame_timer++;
    if (frame_timer >= frame_interval) {
        speech_bubble_frame = (speech_bubble_frame + 1) % _total_frames;
        frame_timer = 0;
    }
}
