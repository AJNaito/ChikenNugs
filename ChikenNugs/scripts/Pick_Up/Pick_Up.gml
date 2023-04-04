// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Pick_Up(object){
	if (global.item != "") {
		return "You're feeble arms can only hold so much, drop an item!"
	}
	
	global.item = object
	return "You picked up" + object
}