/// @description Insert description here
// You can write your code in this editor

shader_set(sh_pulsing)

var time = shader_get_uniform(sh_pulsing, "time")
var dim = shader_get_uniform(sh_pulsing, "room_size");

shader_set_uniform_f(dim, room_width/2, room_height/2)
shader_set_uniform_f(time, _time)

draw_surface(application_surface, 0, 0)
shader_reset()

_time += 0.01