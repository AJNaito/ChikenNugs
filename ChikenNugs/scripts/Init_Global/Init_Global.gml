// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// initialize all objects 
function Init_Global(){
	global.world = ds_map_create()
	
	// base commands - for searching purposes
	global.commands = ds_list_create()
	
	// recognized objs - for searching purposes
	global.objects = ds_map_create()
	global.nuggets_eaten = 0;
	
	var jsonWorld = import_json("Wrld_File.txt", json_decode)
	show_debug_message(jsonWorld == undefined)
	show_debug_message(jsonWorld[? "commands"])
	global.commands = jsonWorld[? "commands"]
}