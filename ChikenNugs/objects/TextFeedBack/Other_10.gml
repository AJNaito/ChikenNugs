/// @description Execute the command
// You can write your code in this editor
interaction = ""
whole_interaction = ""
pos_y = y
t = 0

if (global.result != false) {
	if (global.result[0] == "help") {
		interaction = global.help
		event_user(1)
		return
	} else if (global.result[0] == "credits") {
		
	} else if (global.result[0] == "move") {
		interaction = global.curRoom.Move(global.result[1])
	} else if (global.result[0] == "drop") { 
		interaction = Drop_Item()
	} else {
		interaction = global.curRoom.Execute(global.result)
	}
	
	// for multiple commands per interact/command
	var split_interaction = string_split(interaction, "/", false)
	var length = array_length(split_interaction)
	
	for (var i = 0; i < length; i+=1) {
		// Skip interactions if command was grab
		if (global.result[0] == "grab") {
			var split_int = string_split(interaction, ":", false)
			if (array_length(split_int) != 1) {
				interaction = split_int[1]
			} else {
				Pick_Up(global.result[1])
			}
			break;
		}
		
		interaction = split_interaction[i]
		
		if (string_starts_with(interaction, "conditional")) {
			interaction = Conditional_Interact(interaction)
		}
		
		if (string_starts_with(interaction, "use")) {
			interaction = Use_Item(interaction)
		}

		if (string_starts_with(interaction, "move_room")) {
			interaction = Move_Room(interaction)
		}
		
		if (string_starts_with(interaction, "talk:")) {
			interaction = Talk(interaction, global.result[1])
		}

		if (string_starts_with(interaction, "change_state")) {
			interaction = Change_State(interaction, global.result[1])
		}
		
		if (string_starts_with(interaction, "default")) {
			interaction = Default_Objects(interaction)
		}
	
		if (string_starts_with(interaction, "change_room")) {
			interaction = Change_Room_Desc(interaction)
		}
	
		if (string_starts_with(interaction, "change_level")) {
			interaction = Change_Level(interaction)
		}
		
		if (string_starts_with(interaction, "play_music")) {
			interaction = Play_Music(interaction)
		}
		
		if (string_starts_with(interaction, "return_story")) {
			interaction = global.curRoom.description
		}
	
		if (string_starts_with(interaction, "memory_sequence")) {
			interaction = Memory(interaction)
			with (Mem_Cutscene)
				event_user(0)
			break
		}
	}
} else {
	interaction = "<1>yOu CaNT d@ tHaT<0>"
	with(ScreenShader) {
		ScreenShader.alarm[0] = 500
		ScreenShader.shader = "ripple"
	}
	// activate a visual effect (eyeball?)
}

event_user(1)