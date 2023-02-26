/// @description Draws text on screen
// You can write your code in this editor

var margin = 32;
var width = room_width - margin * 2

var text_draw = string_copy(interaction, 1, char)
draw_text_ext_color(margin, margin, text_draw, -1, width, c_white, c_white, c_white, c_white, 1);

if (char < string_length(interaction)) {
	char += 1
}
show_debug_message(text_draw)
