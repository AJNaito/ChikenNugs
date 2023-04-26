/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1400, 800)

audio_play_sound(Main_Menu, 10, 0, true)
y_select = 0;
y_pos = 1;
text[0] = "Chiken Dream RPG";
text[1] = "Sleep";
text[2] = "Credits";
text[3] = "Exit Game";
y_max = array_length_1d(text)-1

Pulsing_Shader.activate = true

	var jsonCredit = import_json("Credits.txt", json_decode)
	global.credits = jsonCredit[? "credits"]

