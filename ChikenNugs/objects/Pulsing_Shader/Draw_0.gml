/// @description Insert description here
// You can write your code in this editor
if (activate) {

		shader_set(sh_pulsing)
		var resolution = shader_get_uniform(sh_pulsing, "room_size")
		var time = shader_get_uniform(sh_pulsing,"time")
		
		shader_set_uniform_f(resolution, room_width, room_height)
		shader_set_uniform_f(time, _time)
				draw_sprite(Sprite26, 0, 0, 0)

		shader_reset()
		
		_time += 1/room_speed;
}