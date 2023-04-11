// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Memory(interaction){
	var split_interaction = string_split(interaction, "+", false)
	global.nuggets_eaten++;
	
	// disable input
	instance_deactivate_object(TextInput)
	
	// activate memory click through
	instance_activate_object(Mem_Cutscene)
	
	// set argument
	with (Mem_Cutscene) {
		Mem_Cutscene.scene_name = split_interaction[1]
		event_user(0)
	}
	// call event
	
	// dont return anything
	
	// play cutscene after
	// Play_Cutscene(...)
	return ""
}