/// @description Insert description here
// You can write your code in this editor
shader_set(sh_ascii);

var resolution = shader_get_uniform(sh_ascii, "zoom")
var dim = shader_get_uniform(sh_ascii, "room_size")

shader_set_uniform_i(resolution, 1)
shader_set_uniform_i(dim, 64, 89)

draw_self();
shader_reset();
