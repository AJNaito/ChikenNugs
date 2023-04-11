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
	// call event
	
	// dont return anything
	
	// play cutscene after
	// Play_Cutscene(...)
	return "<4>Pretend that you played through a level and a cutscene played~~.\nA memory was unlocked, things have changed<0>"
}