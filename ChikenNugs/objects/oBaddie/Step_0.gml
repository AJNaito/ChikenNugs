/// Face the correct direction
if( xp>x ) {
    if(  sprite_index != Baddie_Walk_Left ) sprite_index = Baddie_Walk_Left;
}else{
    if(  sprite_index != Baddie_Walk_Right ) sprite_index = Baddie_Walk_Right;
}
xp=x;

if (global.nuggets_eaten < 1) {
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