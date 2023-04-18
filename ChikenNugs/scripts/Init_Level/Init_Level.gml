// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Init_Level(currentLevel){
	show_debug_message("level")
	
	global.level = currentLevel
	
	// level sound
	audio_stop_all()
	switch(currentLevel) {
		case "start_level":
			audio_play_sound(Intro, 20, true) 
		break;
		case "Candy_Forest":
			audio_play_sound(Candy_Forest, 20, true)
		break;
		case "Waking_Room":
			audio_play_sound(Abyss, 20, true)
		break;
		case "Purple_Desert":
			show_debug_message("HERE")
			audio_play_sound(Purple_Desert, 20, true)
		break;
		case "Chickenville":
			audio_play_sound(Restaurant, 20, true);
		break;
	}
	
	// delete previous level
	for (var k = ds_map_find_first(global.world); !is_undefined(k); k = ds_map_find_next(global.world, k)) {
		var _room = global.world[? k];
		
		// don't delete start room -- want to keep persistant
		
		
		with(Room) {
			_room.Destroy()
			delete(_room)
		}
		
	}
	
	for (var k = ds_map_find_first(global.objects); !is_undefined(k); k = ds_map_find_next(global.objects, k)) {
		var persistent_objects = ["candy", "hourglass", "toe", "desk", "gemstones","hand","microwave","nugget","self","stove","things"]
		var skip = false;
		for (var i = 0; i < array_length(persistent_objects); i++) {
			if (k == persistent_objects[i]) {
				skip = true;
				break;
			}
		}
		
		if (skip == true)
			continue;
		// don't delete objects from start_room -- want to keep persistant
		
		var _object = global.objects[? k];
		
		with (Object) {
			_object.Destroy()
			delete(_object)
		}
		ds_map_delete(global.objects, k)
	}
	
	ds_map_destroy(global.world)
	
	// initiate another level
	global.world = ds_map_create()
	
	// Reading 
	var fileName = file_find_first("Levels/" + currentLevel + "/*.txt", 0)
	while(fileName != "") {
		show_debug_message(fileName)
		var jsonRoom = import_json("Levels/" + currentLevel + "/"+ fileName, json_decode)
		
		var room_name = jsonRoom[? "name"]
		var objects = jsonRoom[? "objects"]
		
		var room_object = new Room(room_name, 
			jsonRoom[? "commands"], 
			objects, 
			jsonRoom[? "story"])
			
		// create objects to put in global
		for (var i = 0; i < ds_list_size(objects); i++) {
			if (global.objects[? ds_list_find_value(objects, i)] == undefined) {
				// read object file
				var obj_json = import_json("Objects/" +  ds_list_find_value(objects, i) + ".txt", json_decode)
				
				var sim_words = obj_json[? "other"]
				for (var index = 0; index < ds_list_size(sim_words); index++) {
					ds_map_add(global.object_association, ds_list_find_value(sim_words, index), ds_list_find_value(objects,i))
				}
				
				obj_json = obj_json[? currentLevel]
				
				var object = new Object(
					 ds_list_find_value(objects, i), 
					obj_json
				)
				
				ds_map_add(global.objects,  ds_list_find_value(objects, i), object)
			}
		}
		
		// add room to the global
		ds_map_add(global.world, room_name, room_object)
		
		fileName = file_find_next()
	}
	
	global.item = ""
	global.curRoom = global.world[? ds_map_find_first(global.world)]
	
	file_find_close()
}