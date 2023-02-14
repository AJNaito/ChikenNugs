// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_interact(){
	if (interact) {
		var nugget_instance = instance_place(x, y, Le_Nugget);
		if (nugget_instance != noone) {
			global.nuggets_eaten++;
			instance_destroy(nugget_instance);
		}
	}
}