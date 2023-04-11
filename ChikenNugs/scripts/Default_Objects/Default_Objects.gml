// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Default_Objects(interaction){
	var split_interaction = string_split(interaction, ":", false);
	
	for (var i = 0; i < array_length(split_interaction) - 1; i++) {
		ds_map_replace(obj, "state", "default")
	}
	
	return split_interaction[array_length(split_interaction) - 1];
}