// Chatterbox Management
function initialize_chatterbox() {
	
	if (global.current_language == 0) {
		ChatterboxLoadFromFile("english.yarn");
	} else if (global.current_language == 1) {
		ChatterboxLoadFromFile("portuguese.yarn");
	}
    
    chatterbox = ChatterboxCreate();
    ChatterboxJump(chatterbox, "Start");
	
}

function update_chatterbox() {
    if (chatterbox != noone) { // Verifica se chatterbox foi inicializado
        text = ChatterboxGetContent(chatterbox, 0); // Obtém o conteúdo de texto
        character = ChatterboxGetContentSpeaker(chatterbox, 0); // Obtém o personagem falando
        node_title = ChatterboxGetCurrent(chatterbox); // Obtém o título do nó atual
		
		verify_current_node();
    }
}

function continue_chatterbox_dialogue() {
    
	if (mouse_check_button_pressed(mb_left)) {
      
		if (!is_text_complete) {
            typist.skip();
            is_text_complete = true; 
        
		} else if (ChatterboxIsWaiting(chatterbox)) { 
            ChatterboxContinue(chatterbox);
            update_chatterbox();
            is_text_complete = false; 
        }
    }
}

function verify_current_node() {

    if (node_title == "End Game") { 
        room_goto(rm_splash_credits); // Transição para os créditos
    }

    if (node_title == "Intro") { 
        is_neriah_here = true; // Define que o personagem está presente
    }

    if (node_title == "Intro 2") { 
        is_neriah_here = false; // Define que o personagem não está presente
        delete_character(); // Chama a função para apagar o personagem
    }
}