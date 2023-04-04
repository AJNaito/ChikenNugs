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
	// normalized coords
	vec2 uv = gl_FragCoord.xy/room_size;
	
	// offset color
	float red = texture2D(gm_BaseTexture, uv - vec2(offset_x.x, offset_y.x)).r;
	float blue = texture2D(gm_BaseTexture, uv).b;
	float green = texture2D(gm_BaseTexture, uv + vec2(offset_x.y, offset_y.y)).g;
	
	// display color
    gl_FragColor = vec4(red, blue, green, 1.);
}
