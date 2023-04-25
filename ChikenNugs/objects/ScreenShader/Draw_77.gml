/// @description Insert description here
// You can write your code in this editor
application_surface_draw_enable(true)
switch (shader) {
	case "ripple":
		shader_set(sh_ripple)
		application_surface_draw_enable(false)

		var resolution = shader_get_uniform(sh_ripple, "room_size")
		var wave_effect = shader_get_uniform(sh_ripple, "wave_effect")
		var time = shader_get_uniform(sh_ripple, "time")
		var mouse_pos = shader_get_uniform(sh_ripple, "mouse_position")
		
		shader_set_uniform_f(time, _time)
		shader_set_uniform_f(mouse_pos, mouse_x, mouse_y)
		shader_set_uniform_f(wave_effect, .03 * (global.nuggets_eaten + 1))
		shader_set_uniform_f(resolution, room_width, room_height)
		draw_surface(application_surface, 0 ,0)
		shader_reset()


	break
	case "ripple_color":
		shader_set(sh_color_ripple)
		application_surface_draw_enable(false)

		var resolution = shader_get_uniform(sh_color_ripple, "room_size")
		var wave_effect = shader_get_uniform(sh_color_ripple, "wave_effect")
		var mouse_pos = shader_get_uniform(sh_color_ripple, "mouse_position")
		var time = shader_get_uniform(sh_color_ripple, "time")
		var offset_x = shader_get_uniform(sh_color_skew, "offset_x");
		
		shader_set_uniform_f(offset_x, 1., -1.);
		shader_set_uniform_f(time, _time)
		shader_set_uniform_f(mouse_pos, mouse_x, mouse_y)
		shader_set_uniform_f(wave_effect, .03 * (global.nuggets_eaten + 1))
		shader_set_uniform_f(resolution, room_width, room_height)
		
		draw_surface(application_surface, 0 ,0)
		shader_reset()
	break;
	case "color_skew":
	application_surface_draw_enable(false)

		shader_set(sh_color_skew)
		var offset_x = shader_get_uniform(sh_color_skew, "offset_x");
		var offset_y = shader_get_uniform(sh_color_skew, "offset_y");
		
		shader_set_uniform_f(offset_x, (5 * (1/time)), -5);
		shader_set_uniform_f(offset_y, 5, -5);
		draw_surface(application_surface, 0 ,0)
		shader_reset()


	break
	case "pulsing":


	break
	case "warp":
	application_surface_draw_enable(false)

		shader_set(sh_warp);
		
		var room_size = shader_get_uniform(sh_warp, "room_size")
		var mouse_pos = shader_get_uniform(sh_warp, "mouse_position")
		var warp_power = shader_get_uniform(sh_warp, "power")
		
		shader_set_uniform_f(warp_power, 1.)
		shader_set_uniform_f(mouse_pos, mouse_x, mouse_y)
		shader_set_uniform_f(room_size, room_width, room_height)
		draw_surface(application_surface, 0 ,0)
		shader_reset()

	break
	/// texture skew not working
	case "Texture_Skew":
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

	break;
	case "ascii":
	application_surface_draw_enable(false)

		shader_set(sh_ascii)
		var resolution = shader_get_uniform(sh_ascii, "zoom")
		var dim = shader_get_uniform(sh_ascii, "room_size")
		
		shader_set_uniform_f(resolution, 1.0)
		shader_set_uniform_f(dim, room_width, room_height)
		draw_surface(application_surface, 0 ,0)
shader_reset()

	break
	default:
	application_surface_draw_enable(false)

		shader_set(sh_nothing)
		draw_surface(application_surface, 0 ,0)
shader_reset()

	break;
	
}


if (shader != "") {
	_time += (2./room_speed)
}

