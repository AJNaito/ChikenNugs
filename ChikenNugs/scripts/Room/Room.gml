// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Room(name, nugget_level, connected, commands, objs, story) constructor {
	room_name = name;
	nug_lvl = nugget_level
	connected_room = connected
	cmds = commands
	objects = objs
	description = story
	
	/// instruction is the pair of command and object
	static Execute = function (instruction) {
		var recognized_verb = Binary_Search(instruction[0], cmds)
		var recognized_obj = Binary_Search(instruction[1], objects)
		
		if (recognized_obj == "room") 
			return description
		
		if (recognized_verb == false || recognized_obj == false) {
			return "You think about it hard... But nothing happens"
		}
		
		var obj = global.objects[? recognized_obj]
		return obj.interact(recognized_verb, room_name)
	}
	
	static Move = function (dir) {
		var new_room = ""
		
		switch (string(dir)) {
			case "north":
				new_room = ds_list_find_value(connected_room, 0)
				break;
			case "south":
				new_room = ds_list_find_value(connected_room, 1)
				break;
			case "east":
				new_room = ds_list_find_value(connected_room, 2)
				break;
			default:
				new_room = ds_list_find_value(connected_room, 3)
				break;
		}
		
		if (new_room == "none") 
			return "You thump against the wall"
		
		var _room = global.world[? new_room]
			if (_room.nug_lvl > global.nuggets_eaten)
				return "The wall warbles as you hit it"
			else {
				global.curRoom = _room
				return _room.description
			}
	}
	
	static Destroy = function () {
		delete room_name
		delete nug_lvl
		delete connected_room
		delete cmds
		delete objects
		delete description
	}
}
	
	