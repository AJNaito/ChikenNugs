// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// initialize all objects 
function Init_Global(){
	global.world = ds_map_create()
	global.object_association = ds_map_create()
	
	// base commands - for searching purposes
	global.commands = ds_map_create()
	
	// recognized objs - for searching purposes
	global.objects = ds_map_create()
	global.nuggets_eaten = 0;
	
	var jsonWorld = import_json("Wrld_File.txt", json_decode)
	show_debug_message(jsonWorld[? "commands"])
	var all_commands = jsonWorld[? "commands"]
	for (var k = 0; k != ds_list_size(all_commands); k++) {
		var word = ds_list_find_value(all_commands, k)
		var associated_words = jsonWorld[? word]
		if ( associated_words != undefined) {
			for (var i = 0; i != ds_list_size(associated_words); i++) {
				ds_map_add(global.commands, ds_list_find_value(associated_words, i), word)
			}
		}
		ds_map_add(global.commands, word, word)
	}
	
	global.music = jsonWorld[? "music"]
	global.help = jsonWorld[? "help_text"]
	global.item = ""
	
	with (TextFeedBack) {
		global.feedback.whole_interaction = jsonWorld[? "intro"]
		global.feedback.history_length = string_length(global.feedback.whole_interaction)
		ds_list_add(global.feedback.interaction_history, global.feedback.whole_interaction)
	}
	delete jsonWorld
}