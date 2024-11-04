/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// No evento Step
camera_set_view_pos(camera, x, y);
x = lerp(x, x + 50, 0.08); // Se isso estiver movendo a câmera, você pode ajustar conforme necessário
