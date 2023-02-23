// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Init_Level(currentLevel){
	// delete previous level
	for (var k = ds_map_find_first(global.world); !is_undefined(k); k = ds_map_find_next(global.world, k)) {
		var _room = global.world[? k];
		
		with(Room) {
			_room.Destroy()
			delete(_room)
		}
		
	}
	
	for (var k = ds_map_find_first(global.objects); !is_undefined(k); k = ds_map_find_next(global.objects, k)) {
		var _object = global.objects[? k];
		
		with (Object) {
			_object.Destroy()
			delete(_object)
		}
	}
	ds_map_destroy(global.world)
	
	// initiate another level
	global.world = ds_map_create()
	global.objects = ds_map_create()
	global.curLevel = currentLevel
	
	// Reading 
	var fileName = file_find_first(working_directory + currentLevel + "/*.txt")
	while(fileName != "") {
		var jsonText = file_text_read_string(fileName)
		var jsonRoom = json_decode(jsonText)
		
		var room_name = jsonRoom[? "name"]
		var objects = jsonRoom[? "objects"]
		
		var room_object = new Room(room_name, 
			jsonRoom[? "nugget_level"],
			jsonRoom[? "connected"],
			jsonRoom[? "commands"], 
			objects, 
			jsonRoom[? "story"])
			
		// create objects to put in global
		for (var i = 0; i < array_length(objects); i++) {
			if (global.objects[? objects[i]] != undefined) {
				// read object file
				var obj_json = json_decode(file_text_read_string(working_directory + Objects + objects[i] + ".txt"))
				obj_json = obj_json[? currentLevel]
				var object = new Object(
					object[i], 
					obj_json
				)
				
				ds_map_add(global.objects, obj_json)
			}
		}
		
		// add room to the global
		ds_map_add(global.world, room_name, room_object)
		
		file_find_next()
	}
	
	file_find_close()
}