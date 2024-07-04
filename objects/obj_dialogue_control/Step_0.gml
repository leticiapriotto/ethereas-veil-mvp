/// @description text formating and chat progression

if ChatterboxIsWaiting(chatterbox) {
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