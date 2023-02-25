/// @description Execute the command
// You can write your code in this editor
if (global.result != false) {
	if (global.result[0] == "help") {
		interaction = ToString()
	} else if (global.result[0] == "move") {
			interaction = global.curRoom.Move(global.result[1])
	} else {
			interaction = global.curRoom.Execute(global.result)
	}
} else {
	interaction = "Unrecognized Command"
}

if (string_starts_with(interaction, "play")) {
	// special command - play music/sfx
	var audio = string_split(interaction, ":", false)
	audio_play_sound(audio[1], 10, false)
	if (array_length(audio) == 3) 
		interaction = audio[2]
	else interaction = ""
}

char = 0
show_debug_message(interaction)
