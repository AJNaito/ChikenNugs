/// @description Check for Enter Button 
// You can write your code in this editor
if (keyboard_check(vk_enter)) {
	// dialogue is finished, go to main room again
	if (cur_dialogue == ds_list_size(dialogue_data)) {
		// disable self
		instance_deactivate_object(self)
		
		// set interaction
		with (TextFeedBack) {
			interaction = "You slowly drift back...\nYou're in the main room...\nThings are different"
		}
		
		// initiate the start level
		Init_Level("start_level")
		
		// reactivate input
		instance_activate_object(TextInput)
		global.nuggets_eaten++;
		return;
	}
	
	with(TextFeedBack) {
		interaction = ds_list_find_value(dialogue_data, cur_dialogue)
	}
	
	// increment the dialogue
	cur_dialogue++;
}

// set 
var effect = string_split(ds_list_find_value(effect_data, cur_effect), ":", false)
var effect_dur = string_split(effect[1], "-", false)

// effect shouldn't start yet
if (effect_dur[0] > curEffect)
	return ;

if (effect_dur[0] <= curEffect && effect_dur[1] >= curEffect) {
	with(ScreenShader) {
		shader = effect[0]
	}
} else {
	// go to next effect
	curEffect++;
}


