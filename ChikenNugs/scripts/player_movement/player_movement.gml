// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_movement(){
	x_dir = right - left
	y_dir = down - up;
	
	if place_meeting(x + spd * x_dir, y, Obstacle) {
		x_dir = 0;
	}
	
	if place_meeting(x, y + spd * y_dir, Obstacle) {
		y_dir = 0;
	}
	
	x += spd * x_dir;
	y += spd * y_dir;
}