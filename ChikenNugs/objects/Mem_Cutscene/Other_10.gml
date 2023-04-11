/// @description Load "Scene" data
// You can write your code in this editor
switch (scene_name) {
	case "Memory_1":
		array_push(global.levels_cleared, "nugget");
	break;
	case "Memory_2":
			array_push(global.levels_cleared, "Candy_Forest");

	break;
	case "Memory_3":
			array_push(global.levels_cleared, "Purple_Desert");

	break;
	case "Memory_4":
			array_push(global.levels_cleared, "Chickenville");
	break;
}

var json_scene = import_json("Memory/"+scene_name,json_decode)

dialogue_data = json_scene[? "story"]
effect_data = json_scene[? "effects"]

with(TextFeedBack) {
	interaction = ds_list_find_value(dialogue_data, 0)
}

cur_dialogue = 0;
curEffect = 0;