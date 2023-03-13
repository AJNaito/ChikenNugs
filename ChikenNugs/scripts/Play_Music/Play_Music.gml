// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Play_Music(interaction){
	// special command - play music/sfx
	var audio = string_split(interaction, ":", false)
	audio_play_sound(asset_get_index(audio[1]), 10, false)
	
	if (array_length(audio) == 3) 
		return audio[2]
	else return ""
}