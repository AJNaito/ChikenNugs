//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 room_size;

// how much to offset red and green by
uniform vec2 offset_x;
uniform vec2 offset_y;

void main()
{
	// offset color
	vec4 red = texture2D(gm_BaseTexture,vec2( v_vTexcoord.x - 2., v_vTexcoord.y));
	vec4 blue = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 green = texture2D(gm_BaseTexture, v_vTexcoord + vec2(2., 0.));
	
	// display color
    gl_FragColor = vec4(red.r, blue.b, green.g, 1.);
}
