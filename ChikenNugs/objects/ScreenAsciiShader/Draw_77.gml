/// @description converts everything on the screen to the shader version
// You can write your code in this editor
shader_set(sh_ascii)

// get the uniforms
var resolution = shader_get_uniform(sh_ascii, "zoom")
var dim = shader_get_uniform(sh_ascii, "room_size")

// set the resolution (will be based on the levels completed later
shader_set_uniform_f(resolution, 1.0)
shader_set_uniform_f(dim, room_width, room_height)

draw_surface(application_surface, 0 ,0)
shader_reset()