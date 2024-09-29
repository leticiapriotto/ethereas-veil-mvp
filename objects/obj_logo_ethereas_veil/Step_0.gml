/// @description fade in and out

// fade in
if image_alpha < 1 && !fading_out {
    image_alpha += 0.01; // fade in speed
}

// checks if should start fade out after minimum display time
if image_alpha >= 1 && display_time > 0 {
    display_time--;
} else if image_alpha >= 1 {
    fading_out = true;
    image_alpha = 1; // guarantees that alpha is not greater than 1
}

// fade out
if fading_out {
    image_alpha -= 0.01; // fade out speed

    if image_alpha <= 0 {
        room_goto(rm_menu);
    }
}
