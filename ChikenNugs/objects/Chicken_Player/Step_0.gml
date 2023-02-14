/// @description Insert description here
// You can write your code in this editor
player_input();
player_movement();
player_interact();

if (global.nuggets_eaten == 1) {
	room_goto_next();
}