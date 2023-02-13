// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_input(){
	var key = keyboard_lastchar;
	left = keyboard_check(vk_left) || (ord(key) == ord("a"))
	right = keyboard_check(vk_right) || (ord(key) == ord("d"))
	up = keyboard_check(vk_up) || (ord(key) == ord("w"))
	down = keyboard_check(vk_down) || (ord(key) == ord("s"))
	
	interact = (ord(key) == ord("e"))
}