// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Use_Item(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	if (global.item == split_interaction[1]) {
		if (array_length(split_interaction) > 2) {
			// condition!!!
			var obj = global.objects[? split_interaction[1]]
			obj = obj[? global.curRoom.room_name]
			if (obj[? "state"] == split_interaction[2]) {
				return split_interaction[3]
			}
		}
	}
	
	return "That's not quite right -- maybe anotherrrr???"
}