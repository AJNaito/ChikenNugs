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
	
	var world_file = file_text_read_string(working_directory + "Wrld_File.txt")
	var jsonWorld = json_decode(world_file)
	global.commands = jsonWorld[? "commands"]
}