// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Object(name, _interactions) constructor {
	obj_name = name
	interaction = ds_map_create()
	talk = 0
	ds_map_copy(interaction, _interactions)
	
	static interact = function (command, room_name) {
		var room_inter = interaction[? room_name]
			
		if (room_inter[? command] == undefined) {
			return "<1>HEY! You can't do that!<0>\n...\nWe didn't think of that"
		}
		return ds_list_find_value(room_inter[? command], global.nuggets_eaten)
	}
	
	static Destroy = function () {
		delete obj_name
		ds_map_clear(interaction)
		
		delete interaction
	}
}