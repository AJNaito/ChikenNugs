// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Restart(){
	// reset all global variables - prevent memory leaks
	global.curRoom.Destroy()
	ds_map_destroy(curRoom);
	
	ds_map_destroy(global.commands)
	ds_map_destroy(global.object_association)
	
	// destory lists
	ds_list_destroy(global.music)
	
	global.item = ""
	global.help = ""
	
	// traverse objects and destroy them
	for (var k = ds_map_find_first(global.world); !is_undefined(k); k = ds_map_find_next(global.world, k)) {
		var _room = global.world[? k];
		
		// don't delete start room -- want to keep persistant
		
		
		with(Room) {
			_room.Destroy()
			delete(_room)
		}
	}
	
	var k = ds_map_find_first(global.objects)
	while (!is_undefined(k)) {
		var _object = global.objects[? k];
		k = ds_map_find_next(global.objects, k)

		ds_map_delete(global.objects, _object.obj_name)

		
		with (Object) {
			_object.Destroy()
			delete(_object)
		}
	}
	
	ds_map_destroy(global.objects)
	ds_map_destroy(global.world)
}