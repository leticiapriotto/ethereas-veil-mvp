/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Atualiza a posição do objeto na direção `x`
x += velocidade_x;

// Verifica se o objeto alcançou a borda da tela e inverte a direção
if (x > room_width - sprite_width / 2 || x < sprite_width / 2) {
    velocidade_x = -velocidade_x; // Inverte a direção
}
