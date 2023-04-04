/// @description Execute the command
// You can write your code in this editor
interaction = ""
t = 0

if (global.result != false) {
	if (global.result[0] == "help") {
		interaction = global.help
	} else if (global.result[0] == "move") {
		interaction = global.curRoom.Move(global.result[1])
	} else if (global.result[0] == "grab") {
		interaction = Pick_Up(global.result[1])
	} else if (global.result[0] == "drop") { 
		interaction = Drop_Item()
	} else {
		interaction = global.curRoom.Execute(global.result)
	}
	
	// for multiple commands per interact/command
	var split_interaction = string_split(interaction, "/", false)
	var length = array_length(split_interaction)
	
	for (var i = 0; i < length; i+=1) {
		interaction = split_interaction[i]
		
		if (string_starts_with(interaction, "play_music")) {
			interaction = Play_Music(interaction)
		}

		if (string_starts_with(interaction, "move_room")) {
			interaction = Move_Room(interaction)
		}

		if (string_starts_with(interaction, "conditional")) {
			interaction = Conditional_Interact(interaction, i == length -1)
		}

		if (string_starts_with(interaction, "change_state")) {
			interaction = Change_State(interaction, global.result[1])
		}
	
		if (string_starts_with(interaction, "change_room")) {
			interaction = Change_Room_Desc(interaction)
		}
	
		if (string_starts_with(interaction, "change_level")) {
			interaction = Change_Level(interaction)
		}
	
		if (string_starts_with(interaction, "memory_sequence")) {
			interaction = Memory(interaction, i == length - 1)
		}
		
		if (string_starts_with(interaction, "use")) {
			interaction = Use_Item(interaction)
		}
	}
} else {
	interaction = "<1>yOu CaNT d@ tHaT<0>"
	// activate a visual effect (eyeball?)
}

char = 0