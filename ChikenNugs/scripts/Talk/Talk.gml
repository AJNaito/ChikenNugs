// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Talk(interaction, obj_name) {
	var object = global.objects[? obj_name]
	
	var split_interaction = string_split(interaction, ":" , false)
	var obj_interaction = ds_list_find_value(object[? "talk"], object.talk)
	
	object.talk = object.talk % real(split_interaction[1])
	
	return obj_interaction;
}