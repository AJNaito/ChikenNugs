/// @description converts everything on the screen to the shader version
// You can write your code in this editor
shader_set(sh_ascii)

// get the uniforms
var resolution = shader_get_uniform(sh_ascii, "resolution")

// set the resolution (will be based on the levels completed later
shader_set_uniform_i(resolution, 1)

draw_surface(application_surface, 0 ,0)
shader_reset()