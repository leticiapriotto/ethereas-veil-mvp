// Chatterbox Management
function initialize_chatterbox() {
    ChatterboxLoadFromFile("test.yarn");
    chatterbox = ChatterboxCreate();
    ChatterboxJump(chatterbox, "Intro");
	
}

function update_chatterbox() {
    if (chatterbox != noone) { // Verifica se chatterbox foi inicializado
        text = ChatterboxGetContent(chatterbox, 0); // Obtém o conteúdo de texto
        character = ChatterboxGetContentSpeaker(chatterbox, 0); // Obtém o personagem falando
        node_title = ChatterboxGetCurrent(chatterbox); // Obtém o título do nó atual

        // Verifica se chegou no nó "End Game" e troca de sala
        if (node_title == "End Game") { 
            room_goto(rm_splash_credits); // Transição para os créditos
        }

        // Condição para "Intro", faz o personagem aparecer
        if (node_title == "Intro") { 
            is_neriah_here = true; // Define que o personagem está presente
        }

        // Condição para "Intro 2", faz o personagem desaparecer
        if (node_title == "Intro 2") { 
            is_neriah_here = false; // Define que o personagem não está presente
            delete_character(); // Chama a função para apagar o personagem
        }
    }
}

function continue_chatterbox_dialogue() {
    if (ChatterboxIsWaiting(chatterbox) && mouse_check_button_pressed(mb_left)) {
        ChatterboxContinue(chatterbox);
        update_chatterbox(); // Atualiza após continuar o diálogo
    }
}
