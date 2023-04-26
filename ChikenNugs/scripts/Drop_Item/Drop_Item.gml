// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Drop_Item() {
	if (global.item == "") {
		return "YOU DROP!\n... Air?...\nYou had nothing in your possession"
	}
	global.item = ""
	
	return "PLUNK! You dropped the item in your hand"
}