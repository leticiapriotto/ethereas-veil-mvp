/// @description Inserir descrição aqui

// Fade in
if image_alpha < 1 && !fading_out {
    image_alpha += 0.01; // Ajuste o valor para controlar a velocidade do fade in
}

// Verifica se deve iniciar o fade out após o tempo mínimo de exibição
if image_alpha >= 1 && display_time > 0 {
    display_time--;
} else if image_alpha >= 1 {
    fading_out = true;
    image_alpha = 1; // Garante que a alpha não passe de 1
}

// Fade out
if fading_out {
    image_alpha -= 0.01; // Ajuste o valor para controlar a velocidade do fade out

    if image_alpha <= 0 {
        room_goto(rm_splash_ethereas_veil); // Troca para a sala do menu principal após o fade out completo
    }
}
