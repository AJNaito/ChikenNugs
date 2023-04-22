/// @description Insert description here
// You can write your code in this editor
global.feedback = self
interaction = ""
interaction_history = ds_list_create() // add pairs 
history_length = 0
whole_interaction = ""

char = 0

// increase this variable if you wanna have a faster text speed
char_speed = 1.5
pause = false
skip = false


charHeight = string_height("M")
charSize = string_width("L")
pos_x = x
pos_y = y

scale = 3
x_buffer = 2 * scale
y_buffer = 3 * scale

// text effects
t = 0
amplitude = 4
freq = 2


draw_set_halign(fa_center)
draw_set_valign(fa_top)

Init_Global()
Init_Level("start_level")