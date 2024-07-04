/// @description text and character display
if (!ChatterboxIsStopped(chatterbox)) {
    var _text_x = room_width / 4;
	var _text_y = room_height / 4;
    
    switch (character) {
        case "Soul":
            draw_sprite(spr_soul, 0, _text_x, _text_y + 300);
            break;
        case "Chaos":
            draw_sprite(spr_caos, 0, 1024.5, _text_y + 300); 
            break;
    }
    
    scribble(text).wrap(850).draw(_text_x, _text_y, typist);

}