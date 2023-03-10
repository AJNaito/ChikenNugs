// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// argument1 - user message
/// argument2 - array of accepted verb commands (Room Based) -- sorted to help with searching
/// argument3 - array of accepted noun commands (Room Based) -- sorted to help with searching
/// Returns either false or a pair of words (accepted commands)
function Text_Parser(user_message){
	var command = ""
	var obj = ""
	
	var split_elements = string_split(user_message, " ")
	var size = array_length(split_elements)
	
	var i
	for (i = 0; i < size; i++) {
		var verb_res = ds_list_find_index(global.commands, array_get(split_elements, i))
		
		if (verb_res != -1) {
			command = array_get(split_elements, i)
			break;
		}
	}
	
	// object MUST come after verb
	for (; i < size; i++) {
		var obj_res = global.objects[? array_get(split_elements, i)]
		
		if (!is_undefined(obj_res)) {
			obj = array_get(split_elements, i)
			break;
		}
		
		obj_res = array_get(split_elements, i)
		if (obj_res == "north" || obj_res == "south" || obj_res =="east" || obj_res == "west" || obj_res == "room") {
			obj = obj_res
			break;
		}
	}
	
	if (obj == "" || command == "") {
		if (command == "help") {
			return [command, ""]
		}
		
		if (obj == "room") 
			return [command, obj]
		
		return false;
	} else {
		return [command, obj]
	}
}