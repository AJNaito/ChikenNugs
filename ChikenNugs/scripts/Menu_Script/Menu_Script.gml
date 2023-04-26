// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Menu_Script(argument0){
	switch (argument0) {
		case 1:
		room_goto(Game_Area); 
		break;// game start
		case 2: room_goto(Credit_Room)break;
		case 3: game_end(); break;
	}
}