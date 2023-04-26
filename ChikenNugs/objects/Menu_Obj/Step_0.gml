/// @description Insert description here
// You can write your code in this editor
y_select = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
if (y_select != 0) {
	y_pos = clamp(y_pos + y_select, 1, y_max);
	
	// no special sound effect
	audio_play_sound(Button, 10, 0)
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	Menu_Script(y_pos)
}