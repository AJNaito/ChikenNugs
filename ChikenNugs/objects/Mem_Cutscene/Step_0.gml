/// @description Check for Enter Button 
// You can write your code in this editor
if (keyboard_check(vk_enter) || increment) {
	auto = false
	increment = false
	if (!callOnce) {
	callOnce = true
	// dialogue is finished, go to main room again
	if (cur_dialogue == ds_list_size(dialogue_data)) {
		
		ds_list_clear( TextFeedBack.interaction_history)
		
		// set interaction
		TextFeedBack.interaction = "You slowly drift back...\nYou're in the main room...\nThings are different"
		with(TextFeedBack) {
			event_user(1)
		}
		
		// initiate the start level
		Init_Level("start_level")
		
		// reactivate input
		instance_activate_object(TextInput)
		global.nuggets_eaten++;
		
		// disable self
		instance_deactivate_object(Mem_Cutscene)
		
		return;
	}
	TextFeedBack.interaction = ds_list_find_value(dialogue_data, cur_dialogue)
	with(TextFeedBack) {
		event_user(1)
	}
	// increment the dialogue
	cur_dialogue++;
	alarm[0] = 150
	auto = true
	}
} else {
	callOnce = false
	TextFeedBack.interaction = ""
}

// set effect
ScreenShader.shader = effect_data


