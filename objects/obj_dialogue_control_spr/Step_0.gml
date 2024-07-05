/// @description text formating and chat progression

if ChatterboxIsWaiting(chatterbox) and mouse_check_button_pressed(mb_left) {
	text = ChatterboxGetContent(chatterbox, 0);
	character = ChatterboxGetContentSpeaker(chatterbox, 0);
	node_title = ChatterboxGetCurrent(chatterbox); 
	
	// removes character name from text
	if (string_starts_with(text, character + ": ")) {
        text = string_delete(text, 1, string_length(character) + 2);
    }
	
	// chat progression
	if mouse_check_button_pressed(mb_left) {
		ChatterboxContinue(chatterbox);
	}
}


/*

    // Verifica se estamos no nó com opções de diálogo
    if (node_title == "First Decision") {
        // Verifica se há opções de diálogo disponíveis
        var _options_count = ChatterboxGetOptionsCount(chatterbox);
        if (_options_count > 0) {
            options = [];
            for (var i = 0; i < _options_count; i++) {
                options[i] = ChatterboxGetOption(chatterbox, i);
            }
            show_debug_message("Opções disponíveis: " + string(options));
        } else {
            options = undefined; // Limpa as opções se não houver
            show_debug_message("Nenhuma opção disponível neste ponto.");
        }
    } else {
        options = undefined; // Limpa as opções se não estiver no nó correto
    }
	
	
	*/
	