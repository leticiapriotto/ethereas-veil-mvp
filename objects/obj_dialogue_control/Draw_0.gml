/// @description text and options display

// set font for drawing text
draw_set_font(fnt_elegant_typewriter_25);

if (IsChatterbox(chatterbox) && text != undefined) {
    
    // Remove character name from text, wrap, and draw the text
    text = remove_character_name_from_text(text, character);

    // Obtenha os dados do personagem
    var _character_data = get_character_data(character);
    var _speech_bubble = _character_data[3];

    // Verifica e desenha o sprite da caixa de diálogo, se existir
    if (_speech_bubble != noone) {
        var _bubble_x = text_x - (text_width / 2);
        var _bubble_y = text_y - 20; // Ajuste conforme necessário
        draw_sprite_stretched(_speech_bubble, 0, _bubble_x, _bubble_y, text_width, 100); // Ajuste a altura se necessário
    }
    
    // Desenhe o texto por cima da caixa de diálogo
    draw_set_color(c_white);
    chatterbox_wrap_text(text_x, text_y, text, line_spacing, text_width);

    // Desenhe as opções, se existirem
    if (option_count > 0) {
        for (var _i = 0; _i < option_count; _i++) {
            if (ChatterboxGetOptionConditionBool(chatterbox, _i)) {
                var _option_text = ChatterboxGetOption(chatterbox, _i);

                draw_set_alpha((option_index == _i) ? 0.5 : 1); 
                draw_card_sprites(node_title, _i, sprite_x_positions[_i], sprite_y_position);
                draw_set_alpha(1);
            }
        }
    }

    // Desenhe o sprite atual do personagem
    image_speed = 0.15;
    draw_character_sprite(character);
}

// Verifica mouse hover e desenha descrição da carta
if (mouse_over_option && option_index != -1) {
    var _description = "";
    
    switch (node_title) {
        case "First Decision":
            _description = first_decision_descriptions[option_index];
            break;
        case "Second Decision":
            _description = second_decision_descriptions[option_index];
            break;
        case "Third Decision":
            _description = third_decision_descriptions[option_index];
            break;
    }
	
	chatterbox_wrap_text(text_x, 650, _description, line_spacing, text_width);
}
