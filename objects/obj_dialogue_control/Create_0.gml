/// @description chatterbox and options setup

// chatterbox setup
initialize_chatterbox();
update_chatterbox();

speech_bubble_frame = 0; // Global ou variável de instância para rastrear o frame atual da bolha de fala
frame_timer = 0; // Timer para controlar a mudança de frames
frame_interval = 10; // Número de chamadas da função antes de mudar o frame

// options setup
mouse_over_option = false;
option_index = -1;
option_count = 0;

// sprites setup
initialize_card_positions()
initialize_card_descriptions();

line_spacing = 38;
text_width = room_width * 0.8;