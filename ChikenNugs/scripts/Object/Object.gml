// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Object(name, _interactions) constructor {
	show_debug_message("in object")
	obj_name = name
	interaction = ds_map_create()
	ds_map_copy(interaction, _interactions)
	
	static interact = function (command, room_name) {
		var room_inter = interaction[? room_name]
			
		if (room_inter[? command] == undefined) {
			return "<1>You can't do this<0>"
		}
		return ds_list_find_value(room_inter[? command], global.nuggets_eaten)
	}
	
	static Destroy = function () {
		delete obj_name
		ds_map_clear(interaction)
		
		delete interactions
	}
}