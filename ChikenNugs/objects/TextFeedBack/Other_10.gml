/// @description Execute the command
// You can write your code in this editor
interaction = ""

if (global.result != false) {
	if (global.result[0] == "help") {
		interaction = ToString()
	} else if (global.result[0] == "move") {
		interaction = global.curRoom.Move(global.result[1])
	} else {
		interaction = global.curRoom.Execute(global.result)
	}
	
	if (string_starts_with(interaction, "play_music")) {
		interaction = Play_Music(interaction)
	}

	if (string_starts_with(interaction, "move_room")) {
		interaction = Move_Room(interaction)
	}

	if (string_starts_with(interaction, "conditional")) {
		interaction = Conditional_Interact(interaction)
	}

	if (string_starts_with(interaction, "change_state")) {
		interaction = Change_State(interaction, global.result[1])
	}
	
	if (string_starts_with(interaction, "change_room")) {
		interaction = Change_Room_Desc(interaction)
	}
} else {
	interaction = "Unrecognized Command"
}

char = 0