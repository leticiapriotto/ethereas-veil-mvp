/// @description chatterbox and options setup

// Chatterbox setup
ChatterboxLoadFromFile("test.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "Start");
chatterbox_update(); 

// Options setup
option_index = 0;
option_count = 0;

option_y_position = 600;
option_x_positions = [
    room_width / 4,
    room_width / 2,
    3 * room_width / 4
];

// Text layout setup
screen_middle_x = room_width / 2;
screen_top_y = 150; 
line_spacing = 50;
text_width = room_width * 0.8;
