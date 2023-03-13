// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Change_Level(interaction){
	var split_interaction = string_split(interaction, ":", false)
	
	if (array_length(split_interaction) == 3) {
		Init_Level(split_interaction[1])
	}
	
	return split_interaction[2]
}