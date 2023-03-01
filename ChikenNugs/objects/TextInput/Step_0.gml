/// @description Insert description here
// You can write your code in this editor
if ( string_length(keyboard_string) < char_limit) {
	user_msg = keyboard_string;
} else {
	keyboard_string = user_msg;
}

if ( keyboard_check(vk_enter)) {
	if (!callOnce) {
		// pass the message to room
		global.result = Text_Parser(string_lower(user_msg), global.commands, global.objects)
	
		with (TextFeedBack) {
			event_user(0)
		}
	
		user_msg = ""
		keyboard_string = ""
		callOnce = true
	}
} else {
	callOnce = false
}