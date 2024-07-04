/// @description chatterbox and scribble setup

// chatterbox setup
ChatterboxLoadFromFile("dialogue.yarn");
chatterbox = ChatterboxCreate(); 
ChatterboxJump(chatterbox, "Start");

text = ChatterboxGetContent(chatterbox, 0);
character = ChatterboxGetContentSpeaker(chatterbox, 0);
node_title = ChatterboxGetCurrent(chatterbox);

// scribble setup
gpu_set_tex_filter(true);
scribble_font_set_default("fnt_segoe_ui");

// scribble typist setup
typist = scribble_typist();
typist.in(0.3, 100);
typist.ease(SCRIBBLE_EASE.LINEAR, 0, 0, 1, 1, 0, 0.1);