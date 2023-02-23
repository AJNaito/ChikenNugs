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
		
		if (recognized_verb == false || recognized_obj == false) {
			return "You think about it hard... But nothing happens"
		}
		
	}
	
	static Move = function (dir) {
		switch (string(dir)) {
			case "North":
				return array_get(connected_room, 0)
				break;
			case "South":
				return array_get(connected_room, 1)
				break;
			case "East":
				return array_get(connected_room, 2)
				break;
			default:
				return array_get(connected_room, 3)
				break;
			
		}
		return array_get(connected_room, pos)
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
	
	