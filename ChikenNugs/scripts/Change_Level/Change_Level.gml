// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Change_Level(interaction){
	var split_interaction = string_split(interaction, "+", false)
	Init_Level(split_interaction[1])
	
	ds_list_clear(TextFeedBack.interaction_history )
	TextFeedBack.char = 0
	
	return split_interaction[2] + "\n" + global.curRoom.description
}