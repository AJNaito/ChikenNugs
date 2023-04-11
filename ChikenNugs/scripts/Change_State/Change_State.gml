// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Change_State(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	var obj = global.objects[? split_interaction[1]]
	var _room = global.curRoom.room_name
	obj = obj.interaction[? _room]
	ds_map_replace(obj, "state", array_get(split_interaction, 2))
	
	if (array_length(split_interaction) == 4)
		return array_get(split_interaction, 3)
	
	return "the object changed"
}