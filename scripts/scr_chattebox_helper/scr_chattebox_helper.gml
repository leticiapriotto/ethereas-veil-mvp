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
	
	if (node_title == "Start") {
		layer_set_visible(global.layer_bg_light, true);
		layer_set_visible(global.layer_bg_dark, false);
		layer_set_visible(global.layer_bg_letterbox, false);
		layer_set_visible(global.layer_bg, false);
	}
	
	if (node_title == "Intro") {
		layer_set_visible(global.layer_bg_light, false);
		layer_set_visible(global.layer_bg_dark, true);
		layer_set_visible(global.layer_bg_letterbox, false);
		layer_set_visible(global.layer_bg, false);
	}
		

    if (node_title == "T1" || node_title == "T4" ) { 
		layer_set_visible(global.layer_bg_light, false);
		layer_set_visible(global.layer_bg_dark, false);
		layer_set_visible(global.layer_bg_letterbox, true);
		layer_set_visible(global.layer_bg, true);
		
        is_neriah_here = true;
		is_gael_here = false;
		is_gideon_here = false
		delete_char_gael();
		delete_char_gideon();
    }
	
	if (node_title == "T2" || node_title == "T5") { 
        is_neriah_here = false;
		is_gael_here = true;
		is_gideon_here = false;
        delete_char_neriah();
		delete_char_gideon();
    }
	
	if (node_title == "T3" || node_title == "T6") { 
        is_neriah_here = false;
		is_gael_here = false;
		is_gideon_here = true;
        delete_char_neriah();
		delete_char_gael();
    }
	
	
	if (node_title == "End Game") { 
        room_goto(rm_splash_credits); // Transição para os créditos
    }
}