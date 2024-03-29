// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Conditional_Interact(interaction){
	var split_interaction = string_split(interaction, ":", false)
	var size = array_length(split_interaction)
	
	size = size - 2
	
	for (var i = 1; i < size; i+=2) {
		var obj = global.objects[? array_get(split_interaction, i)] 
		if ( array_get(split_interaction, i) == "nugget") {
			obj = obj.interaction[? global.level]
			obj = obj[? global.curRoom.room_name]
		} else {
			obj = obj.interaction[? global.curRoom.room_name]
		}
		
		if (obj[? "state"] != array_get(split_interaction, i + 1)) {
			return split_interaction[size + 1]
		}
	}
	
		return array_get(split_interaction, size)
}