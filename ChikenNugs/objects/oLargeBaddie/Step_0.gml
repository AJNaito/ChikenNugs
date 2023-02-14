/// Face the correct direction
if( xp>x ) {
    if(  sprite_index != LargeBaddie_left ) sprite_index = LargeBaddie_left;
}else{
    if(  sprite_index != LargeBaddie_right ) sprite_index = LargeBaddie_right;
}
xp=x;

if (global.nuggets_eaten != nuggets_vis) {
	if (alpha >= 1.0) {
		alpha_step = -0.01;
	} else {
		alpha_step = 0.01;
	}
	
	alpha += alpha_step;
} else {
	alpha = 1;
}

image_alpha = alpha;
image_blend = Set_Color(nuggets_vis);

draw_self();