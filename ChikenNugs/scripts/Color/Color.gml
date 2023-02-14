// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Set_Color(argument0){
	if (argument0 < global.nuggets_eaten) {
		return c_black;
	} else {
		return c_white;
	}
}