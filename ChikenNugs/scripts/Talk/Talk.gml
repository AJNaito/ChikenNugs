// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Talk(interaction, obj_name) {
	var object = global.objects[? obj_name]
	
	var split_interaction = string_split(interaction, ":" , false)
	var obj = object.interaction[? global.curRoom]
	var objectInteraction = ds_list_find_value(obj[? "talk"], object.talk)
	
	object.talk = (object.talk + 1) % real(split_interaction[1])
	
	return objectInteraction;
}