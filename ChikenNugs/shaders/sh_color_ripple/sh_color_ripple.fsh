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

/// This needs to be fixed, not intended effect
void main()
{
	vec2 center_point = (gl_FragCoord.xy / room_size.xy) - (mouse_position.xy/room_size.xy);
	float cl = length(center_point);
	
	// normalize coords 
	vec2 uv = gl_FragCoord.xy / room_size.xy + ((center_point/cl) * wave_effect) * cos(cl * 12. - time * 4.) * 0.02;
	vec4 red = texture2D(gm_BaseTexture,vec2( v_vTexcoord.x - 2., v_vTexcoord.y));
	vec4 blue = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 green = texture2D(gm_BaseTexture, v_vTexcoord + vec2(2., 0.));
	
	// display color
    gl_FragColor = vec4(red.r, blue.b, green.g, 1.);
}
