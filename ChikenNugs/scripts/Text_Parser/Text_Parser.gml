// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// argument1 - user message
/// argument2 - array of accepted verb commands (Room Based) -- sorted to help with searching
/// argument3 - array of accepted noun commands (Room Based) -- sorted to help with searching
function Text_Parser(user_message, commands, objects){
	var command = ""
	var obj = ""
	
	var split_elements = string_split(user_message, " ")
	var size = array_length(split_elements)
	
	var i
	for (i = 0; i < size; i++) {
		var verb_res = find_valid_element(array_get(split_elements, i), commands);
		
		if (verb_res != false) {
			command = verb_res
			break;
		}
	}
	
	// object MUST come after verb
	for (; i < size; i++) {
		var obj_res = find_valid_element(array_get(split_elements, i), objects);
		
		if (obj_res != false) {
			obj = obj_res
			break;
		}
	}
	
	if (obj == "" || command == "") {
		return false;
	} else {
		return [command, obj]
	}
}

function find_valid_element(element, commands) {
	var lo, hi
	lo = 0;
	hi = array_length(commands);
	
	while (lo < hi) {
		var mid = floor((lo + hi)/2);
		
		var command = array_get(commands, mid)
		if (command == element) {
			return command
		} else if (command < element) {
			lo = mid + 1
		} else {
			hi = mid - 1
		}
	}
	
	return false;
}