/// @description Check for Enter Button 
// You can write your code in this editor
if (increment || keyboard_check(vk_enter)) {
	if (!callOnce) {
		callOnce = true
		auto = false
		increment = false
	// dialogue is finished, go to main room again
	if (cur_dialogue == ds_list_size(dialogue_data)) {
		if (scene_name == "Memory_5") {
			// restart
			Restart()
			room_goto(Menu)
			return;
		}
		
		effect_data = ""
		ScreenShader.shader = ""
		
		ds_list_clear( TextFeedBack.interaction_history)
		
		// set interaction
		TextFeedBack.interaction = "You slowly drift back...\nYou're in the main room...\n<3>Things<0> are still there... the <3>room<0> seems more familiar"
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
		auto = true
		show_debug_message(auto)
		alarm[0] = 5 * room_speed
	}
} else {
	callOnce = false
	TextFeedBack.interaction = ""
}

// set effect
ScreenShader.shader = effect_data


