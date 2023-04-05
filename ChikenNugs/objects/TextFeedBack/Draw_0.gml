/// @description Draws text on screen
// You can write your code in this editor
#region WRITING TEXT


if (char < string_length(whole_interaction) && !pause) {
	if (skip) {
		char = string_length(whole_interaction)
	}
	
	// increment character count
	char += char_speed
	
	// get char at point
	var character = string_char_at(whole_interaction, floor(char))
	
	// check for breaks or pauses
	switch (character) {
		case ".":
		case ",":
		 pause = true
		 alarm[1] = 10
		 break;
	    case "!":
		case "?":
		 pause = true;
		 alarm[1] = 15
		 break;
		default: break;
	}
}
	
	#region set up for effects
	var col = c_white, curChar = 1, yy = pos_y + y_buffer, xx = pos_x + x_buffer, curX = 0, curY = 0
	var curEffect = 0, num_breaks = 0
	#endregion
	
	t += 1
	
	#region Drawing Effects
	// go through the string and start drawing the characters
	repeat (floor(char)) {
		var letter = string_char_at(whole_interaction, curChar)
		
		// detect newline characters -- DON"T PROCESS THEM
		if (letter == "\n") {
			curY += 1; curX = 0
			num_breaks++
		}
		
	/*	if (letter == "\r") {
			yy -= num_breaks * charHeight
			curX = 0
			num_breaks = 0
		}
		*/
		
		// detect effect indicators
		if (letter == "<") {
			if (string_char_at(whole_interaction, curChar + 2) == ">") {
				curEffect = real(string_char_at(whole_interaction, curChar + 1))
				
				// don't process any of the effect indicators
				curChar += 3
				letter = string_char_at(whole_interaction, curChar)
			}
		}
		
		#region draw the effects
		switch (curEffect) {
			case 0: // normal -- nothing special 
				draw_text_color(xx + (curX * charSize), yy + (curY * charHeight), letter, col, col, col, col, 1);
			break;
			case 1: // shaking text
				draw_text_color(xx + (curX * charSize) + random_range(-1, 1), yy + (curY * charHeight) + random_range(-1, 1), letter, col, col , col, col, 1)
			break
			case 2: // wavey text
				var so = t + curChar, shift = sin(so * pi * freq/room_speed) * amplitude;
				draw_text_color(xx + (curX * charSize), yy + (curY*charHeight) + shift, letter, col, col, col, col, 1);
			break
			
			case 3: // color change
				var c1 = make_color_hsv(((t+curChar) % 255), 255, 255);
				var c2 = make_color_hsv(((t+curChar+30) % 255), 255, 255);
				
				draw_text_colour(xx + (curX * charSize), yy + (curY * charHeight), letter, c1, c1, c2, c2, 1)
			break;
			
			case 4: // wavey + color change (ooooooooo :D)
				var so = t + curChar, shift = sin(so * pi * freq / room_speed) * amplitude;
				var c1 = make_colour_hsv((t + curChar) % 255, 255, 255); 
				var c2 = make_colour_hsv((t + curChar + 30) % 255, 255, 255);
				
				draw_text_color(xx + (curX * charSize), yy + (curY * charHeight) + shift, letter, c1, c1, c2, c2, 1)
			break;
			
			case 5: // spin (side to side) 
				var so = t + curChar, shift = sin(so*pi*freq/room_speed);
				var mv = charSize/2, vmv = charHeight / 2;
				draw_set_valign(fa_middle); draw_set_halign(fa_middle);
				draw_text_transformed_color(xx + (curX*charSize) + mv, yy + (curY *charHeight) + vmv, letter, 1, 1, shift * 20, col, col, col, col, 1);
				draw_set_valign(fa_top); draw_set_halign(fa_left);
			break;
			
			case 6: // pulse (small -> big -> small)
				var so = t + curChar, shift = abs(sin(so * pi * freq/room_speed));
				var hmv = charSize / 2, vmv = charHeight / 2;
				
				draw_set_valign(fa_middle); draw_set_halign(fa_middle);
				draw_text_transformed_color(xx + (curX*charSize) + hmv, yy + (curY *charHeight) + vmv, letter, shift, shift,0, col, col, col, col, 1);
				draw_set_valign(fa_top); draw_set_halign(fa_left);
			break;
			
			case 7: // flickering
				var so = t + curChar;
				var shift = sin(so * pi * freq/room_speed);
				draw_text_color(xx + (curX*charSize), yy+(curY * charHeight), letter, col, col, col, col, shift + random_range(-1, 1));
			break;
			
			case 8: // bold text
				draw_text_color(xx + (curX*charSize), yy + (curY *charHeight), "[B]"+letter+"[/B]", col, col, col, col, 1);
			break;
			case 9: // italy text
				draw_text_color(xx + (curX*charSize), yy + (curY * charHeight), "[I]"+letter+"[/I]", col, col, col, col, 1);
			break;
		}
		#endregion
		
		curX += 1
		curChar += 1
	}
	#endregion
#endregion
