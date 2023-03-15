// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Change_Room_Desc(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	for (var k = 1; k < array_length(split_interaction) - 2; k+=2) {
		var obj = global.objects[? array_get(split_interaction, k)]
		var _room = global.curRoom.room_name
		obj = obj.interaction[? _room]
		ds_map_replace(obj, "state", array_get(split_interaction, k+1))
	}
		
	
	global.curRoom.description = array_get(split_interaction, array_length(split_interaction) - 2)
	return string(array_pop(split_interaction))
}