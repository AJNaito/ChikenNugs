/// @description Insert description here
// You can write your code in this editor
application_surface_draw_enable(false)

		shader_set(sh_skew)
		var left_skew = shader_get_uniform(sh_skew, "l_skew")
		var right_skew = shader_get_uniform(sh_skew, "r_skew")
		var time = shader_get_uniform(sh_skew, "time")
		var room_size = shader_get_uniform(sh_skew, "room_size")
		
		shader_set_uniform_f(left_skew, 0.1)// * 1/(global.nuggets_eaten + 1))
		shader_set_uniform_f(right_skew, 0.1)// * 1/(global.nuggets_eaten + 1))
		shader_set_uniform_f(time, _time)
		shader_set_uniform_f(room_size, room_width, room_height)
		draw_surface(application_surface, 0 ,0)
shader_reset()

_time += 2./room_speed;

