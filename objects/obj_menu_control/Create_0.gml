/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

global.show_options = false; 
global.fullscreen =  false
global.text_on_off = "OFF";
global.current_language = 0; 

global.menu_buttons = [
	obj_button_new_game, 
	obj_button_options, 
	obj_button_exit
];

global.options_buttons = [
	obj_button_volume_music,
	obj_button_volume_sound_effects, 
	obj_button_language,
	obj_button_fullscreen,
	obj_button_return
];

//Texts
global.texts = [
    // Inglês (índice 0)
    [
        "New Game",								// obj_button_new_game
        "Options",								// obj_button_options
        "Music Volume",							// obj_button_volume_music
        "Sound Effects Volume",					// obj_button_sound_effects
		"Languague: English",					// obj_button_language
        "Fullscreen: " + global.text_on_off,	// obj_button_fullscreen
        "Return",								// obj_button_return
        "Exit"									// obj_button_exit
    ],
	// Português (índice 1)
    [
        "Novo Jogo",							// obj_button_new_game
        "Opções",								// obj_button_options
        "Volume da Música",						// obj_button_volume_music
        "Volume dos Efeitos Sonoros",			// obj_button_volume_sound_effects
		"Idioma: Português BR",                 // obj_button_language
        "Tela Cheia: " + global.text_on_off,    // obj_button_fullscreen
        "Voltar",								// obj_button_return
        "Sair"									// obj_button_exit
    ],
];

