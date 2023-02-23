// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Object(name, _interactions) {
	obj_name = name
	interaction = ds_map_copy(_interactions)
	
	static interact = function (command, room_name) {
		var room_inter = interaction[? room_name]
		return array_get(room_inter[? command], global.nuggets_eaten)
	}
	
	static Destroy = function () {
		delete obj_name
		ds_map_clear(interaction)
		delete interactions
	}
	
	return obj;
}