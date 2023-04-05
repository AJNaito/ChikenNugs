//
// warping effect to be used for cutscenes -- fish eye warp around mouse position
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 room_size;
uniform float time;

void main()
{
	vec2 uv = gl_FragCoord.xy / room_size.xy;
	
	
	
	
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
