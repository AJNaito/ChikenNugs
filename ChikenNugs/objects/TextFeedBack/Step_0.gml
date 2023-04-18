/// @description Insert description here
// You can write your code in this editor
if (keyboard_check((vk_escape))) {
	skip = true
} else {
	skip = false
}

if (mouse_wheel_up()) {
	pos_y += 20
}

if (mouse_wheel_down()) {
	pos_y -= 20
}