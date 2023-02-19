/// @description Insert description here
// You can write your code in this editor
if (string_length(keyboard_string) < char_limit) {
	user_msg = keyboard_string;
} else {
	keyboard_string = user_msg;
}

if (keyboard_check(vk_enter)) {
	// run the interpreter and clear the user input
	var result = Text_Parser(user_msg, ["welcome"], ["you"])
	
	user_msg = ""
	keyboard_string = ""
}