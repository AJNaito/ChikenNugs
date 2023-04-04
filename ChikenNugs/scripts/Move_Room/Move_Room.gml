// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Move_Room(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	global.curRoom = global.world[? array_get(split_interaction, 1)]
	if (array_length(split_interaction) != 3) {
		return global.curRoom.story
	}
	
	return array_get(split_interaction, 2)
}