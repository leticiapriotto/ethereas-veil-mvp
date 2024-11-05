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
