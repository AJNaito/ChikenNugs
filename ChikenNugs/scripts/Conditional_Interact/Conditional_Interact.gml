// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Conditional_Interact(interaction, getInteraction){
	var split_interaction = string_split(interaction, ":", false)
	var size = array_length(split_interaction)
	
	if (getInteraction) {
		size = size - 2
	}
	
	for (var i = 1; i < size; i+=2) {
		var obj = global.objects[? array_get(split_interaction, i)] 
		obj = obj[? global.curRoom.room_name]
		
		if (obj[? "state"] != array_get(split_interaction, i + 1)) {
			return array_get(split_interaction, size -1)
		}
	}
	
	if (getInteraction)
		return array_get(split_interaction, size - 2)
}