/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_escape)) {
	room_goto(Menu)
	ds_list_clear(TextFeedBack.interaction_history)
}

