// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ToString(){
	show_debug_message("in string")
	
	var _string = ""
	for (var i = 0; i < ds_list_size(global.commands); i++) {
		_string += ds_list_find_value(global.commands, i) + "\n"
	}
	
	return _string
}