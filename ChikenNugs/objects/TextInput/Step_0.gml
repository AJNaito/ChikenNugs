/// @description Insert description here
// You can write your code in this editor
if (string_length(keyboard_string) < char_limit) {
	user_msg = keyboard_string;
} else {
	keyboard_string = user_msg;
}

if (keyboard_check(vk_enter)) {
	// pass the message to room
	var result = Text_Parser(string_lower(user_msg), ["welcome"], ["you"])
	
	if (!result) {
		// invalid result
		
	} else {
		if (result[0]) 
	}
	
	user_msg = ""
	keyboard_string = ""
}