//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float wave_effect;
uniform vec2 room_size;
uniform vec2 mouse_position;

uniform vec2 offset_x;
uniform vec2 offset_y;

void main()
{
	vec2 center_point = (gl_FragCoord.xy / room_size.xy) - (mouse_position.xy/room_size.xy);
	float cl = length(center_point);
	
	// normalize coords 
	vec2 uv = gl_FragCoord.xy / room_size.xy + ((center_point/cl) * wave_effect) * cos(cl * 12. - time * 4.) * 0.02;
	float red = texture2D(gm_BaseTexture, vec2(uv.x + offset_x.x, uv.y + offset_y.x)).x;
	float green = texture2D(gm_BaseTexture, uv).y;
	float blue = texture2D(gm_BaseTexture, vec2(uv.x + offset_x.y, uv.y + offset_y.y)).z;
	
    gl_FragColor = vec4(red, green, blue, 1.);
}
