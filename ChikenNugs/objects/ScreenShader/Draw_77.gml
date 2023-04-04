/// @description Insert description here
// You can write your code in this editor
if (shader == "")
	return;
	
switch (shader) {
	case "ripple":
		shader_set(sh_ripple)
		
		var resolution = shader_get_uniform(sh_ripple, "")
		
	break
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
	break;
	
}

draw_surface(application_surface, 0 ,0)
shader_reset()

_time += 0.1

