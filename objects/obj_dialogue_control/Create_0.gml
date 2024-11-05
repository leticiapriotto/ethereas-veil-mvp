/// @description chatterbox and options setup

// chatterbox setup
initialize_chatterbox();
update_chatterbox();

// options setup
mouse_over_option = false;
option_index = -1;
option_count = 0;

// sprites setup
initialize_card_positions()
initialize_card_descriptions();

text_x = room_width / 2;
text_y = 150; 
line_spacing = 38;
text_width = room_width * 0.8;