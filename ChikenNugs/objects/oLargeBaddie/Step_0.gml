/// Face the correct direction
if( xp>x ) {
    if(  sprite_index != LargeBaddie_left ) sprite_index = LargeBaddie_left;
}else{
    if(  sprite_index != LargeBaddie_right ) sprite_index = LargeBaddie_right;
}
xp=x;

if (alpha >= 1.0) {
		alpha_step = -0.01;
	} else if (alpha <= 0) {
		alpha_step = 0.01;
	}
	
	alpha += alpha_step;

show_debug_message(alpha)

image_alpha = alpha;
image_blend = c_black;

draw_self();