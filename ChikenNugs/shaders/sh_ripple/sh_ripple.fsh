//
// Simple passthrough fragment shader - wavey water like effect
// centered on mouse position (click)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float wave_effect;
uniform vec2 room_size;
uniform vec2 mouse_position;

void main()
{
	vec2 center_point = (gl_FragCoord.xy / room_size.xy) - (mouse_position.xy/room_size.xy);
	float cl = length(center_point);
	
	// normalize coords 
	vec2 uv = gl_FragCoord.xy / room_size.xy + ((center_point/cl) * wave_effect) * cos(cl * 12. - time * 4.) * 0.02;
	
    gl_FragColor = vec4(texture2D( gm_BaseTexture, uv ).xyz, 1.);
}
