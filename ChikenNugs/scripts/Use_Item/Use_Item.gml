// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Use_Item(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	if (global.item == split_interaction[1]) {
		if (array_length(split_interaction) > 2) {
			// condition!!!
			var obj = global.objects[? split_interaction[1]]
			obj = obj.interaction[? global.curRoom.room_name]
			if (obj[? "state"] == split_interaction[2]) {
				return string_join_ext(":", split_interaction[3,array_length(split_interaction)])
			} else {
				return "That's not quite right... maybe I need to <2>do something<2> to it?"
			}
		}
	}
	
	return "That's not quite right -- maybe another item?"
}