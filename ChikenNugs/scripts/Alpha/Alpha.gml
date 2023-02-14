// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_alpha_color(argument0) {
	var nuggets_needed = argument0;
	
	if (global.nuggets_eaten >= nuggets_needed) {
		return 1;
	} else {
		return 0;
	}
}