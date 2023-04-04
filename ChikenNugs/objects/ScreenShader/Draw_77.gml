/// @description Insert description here
// You can write your code in this editor
switch (shader) {
	case "ripple":
		shader_set(sh_ripple)
		
		var resolution = shader_get_uniform(sh_ripple, "room_size")
		var wave_effect = shader_get_uniform(sh_ripple, "wave_effect")
		var time = shader_get_uniform(sh_ripple, "time")
		var mouse_pos = shader_get_uniform(sh_ripple, "mouse_position")
		
		shader_set_uniform_f(time, _time)
		shader_set_uniform_f(mouse_pos, mouse_x, mouse_y)
		shader_set_uniform_f(wave_effect, .1 * (global.nuggets_eaten + 1))
		shader_set_uniform_f(resolution, room_width, room_height)
	break
	case "ripple_color":
		
	break;
	case "pulsing":
		shader_set(sh_pulsing)
	break
	case "warp":
	break
	case "water":
	break
	case "ascii":
		shader_set(sh_ascii)
		var resolution = shader_get_uniform(sh_ascii, "zoom")
		var dim = shader_get_uniform(sh_ascii, "room_size")
		
		shader_set_uniform_f(resolution, 1.0)
		shader_set_uniform_f(dim, room_width, room_height)
		
	break
	
	default:
		shader_set(sh_nothing)
	break;
	
}

draw_surface(application_surface, 0 ,0)
shader_reset()

if (shader != "") {
	_time += 0.1
}

