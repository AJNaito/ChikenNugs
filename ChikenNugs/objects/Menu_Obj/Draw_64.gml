/// @description Insert description here
// You can write your code in this editor
xx = display_get_gui_width()/2;
yy = 100;
draw_set_font(Menu_Font)
draw_set_halign(fa_center)

draw_set_color(c_white)
draw_text(xx, yy, text[0])
yy += 50
for (var i = 1; i <= y_max; i++) {
	if (i == y_pos) draw_set_color(c_white);
	else draw_set_color(c_gray);
	draw_text(xx, yy + i * 150, text[i])
}

draw_set_halign(fa_left)