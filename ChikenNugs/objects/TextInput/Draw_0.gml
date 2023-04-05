/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_black)
draw_set_valign(fa_left);
var curChar = 0
repeat (string_length(user_msg + cursor)) {
	draw_text((x + 25)+ (curChar * charSize), y + 10, string_char_at(user_msg, curChar + 1))
	curChar++
}
draw_text((x + 25) + ((curChar-1) * charSize) , y + 10, cursor);
