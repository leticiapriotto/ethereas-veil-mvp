/// @description chatterbox and options setup

// Chatterbox setup
is_neriah_here = false;
is_text_complete = false;

initialize_chatterbox(); 
update_chatterbox(); 

// Scribble Setup
gpu_set_tex_filter(true);

typist = scribble_typist();
typist.in(0.2, 60);
typist.ease(SCRIBBLE_EASE.ELASTIC, 0, 0, 1, 1, 0, 0);

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
line_spacing = 50;
text_width = room_width * 0.8;
