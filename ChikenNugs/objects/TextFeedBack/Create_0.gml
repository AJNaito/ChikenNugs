/// @description Insert description here
// You can write your code in this editor
global.feedback = self
interaction = ""
char = 0
char_speed = 0.5
pause = false

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