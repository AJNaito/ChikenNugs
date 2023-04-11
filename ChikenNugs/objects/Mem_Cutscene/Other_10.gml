/// @description Load "Scene" data
// You can write your code in this editor
var file= ""

switch (scene_name) {
	/*case "Introduction":
		Memory("a+Introduction");
		Init_Global();
	break;*/
	case "Memory_1":
		array_push(global.levels_cleared, "nugget");
		var obj = global.objects[? "nugget"]
		obj = obj.interaction[? "home"]
		ds_map_replace(obj, "state", "eaten")
		file = "Memory_1.txt"
	break;
	case "Memory_2":
			array_push(global.levels_cleared, "Candy_Forest");
		var obj = global.objects[? "candy"]
		obj = obj.interaction[? "home"]
		ds_map_replace(obj, "state", "eaten")
		file = "Memory_2.txt"
	break;
	case "Memory_3":
			array_push(global.levels_cleared, "Purple_Desert");

		var obj = global.objects[? "hourglass"]
		obj = obj.interaction[? "home"]
		ds_map_replace(obj, "state", "eaten")
		
		file = "Memory_3.txt"
	break;
	case "Memory_4":
			array_push(global.levels_cleared, "Chickenville");
			var obj = global.objects[? "toe"]
			obj = obj.interaction[? "home"]
		ds_map_replace(obj, "state", "eaten")
		
		file = "Memory_4.txt"
	break;
	case "Memory_5": 
		file = "Memory_5.txt"
	break
}
show_debug_message(file_exists("Memory/" + file))
var json_scene = import_json("Memory/"+file,json_decode)

dialogue_data = json_scene[? "story"]
effect_data = json_scene[? "effects"]

TextFeedBack.interaction = ds_list_find_value(dialogue_data, 0)
ds_list_clear(TextFeedBack.interaction_history)

cur_dialogue = 1;
curEffect = 0;