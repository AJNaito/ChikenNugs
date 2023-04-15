// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Room(name, commands, objs, story) constructor {
	show_debug_message("in room")
	
	room_name = name;
	cmds = commands
	objects = objs
	description = story
	
	/// instruction is the pair of command and object
	static Execute = function (instruction) {
		var recognized_verb = ds_list_find_index(cmds, instruction[0])
		
		if (instruction[1] == room_name) 
			return description
			
		var recognized_obj = ds_list_find_index(objects, instruction[1])// Binary_Search(instruction[1], objects)

		
		if (recognized_verb == -1 || recognized_obj == -1) {
			return "You think about it hard... But nothing happens"
		}
		
		var obj = global.objects[? instruction[1]]
		if (instruction[1] == "nugget") {
			obj = obj.interaction[? global.level]
			obj = obj[? room_name]
			if (obj[? instruction[0]] == undefined)
				return  "<1>You can't do this<0>"
			return ds_list_find_value(obj[? instruction[0]], global.nuggets_eaten)
		}
		return obj.interact(instruction[0], room_name)
	}
	
	static Move = function (dir) {
	/*	var new_room = ""
		
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
			*/
	}
	
	static Destroy = function () {
		delete room_name
		delete connected_room
		delete cmds
		delete objects
		delete description
	}
}
	
	