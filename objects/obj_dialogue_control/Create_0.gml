/// @description chatterbox and options setup

// chatterbox setup
ChatterboxLoadFromFile("test.yarn");
chatterbox = ChatterboxCreate();
ChatterboxJump(chatterbox, "Start");
chatterbox_update();

// options setup
option_index = 0;
option_count = 0;

_option_x_positions = [
    room_width / 4,
    room_width / 2,
    3 * room_width / 4
];
