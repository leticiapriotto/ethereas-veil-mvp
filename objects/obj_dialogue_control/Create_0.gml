/// @description chatterbox and options setup

// Chatterbox setup
initialize_chatterbox(); 
update_chatterbox(); 

// Speech Bubble Animation seup
speech_bubble_frame = 0; 
frame_timer = 0; 
frame_interval = 10;

// Options setup
mouse_over_option = false;
option_index = -1;
option_count = 0;

// Sprites setup
initialize_card_positions();
initialize_card_descriptions();

// Text setup
line_spacing = 38;
text_width = room_width * 0.8;
