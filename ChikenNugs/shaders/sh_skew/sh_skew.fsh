//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float l_skew;
uniform float r_skew;
uniform float time;
uniform vec2 room_size;

void main()
{
	vec2 uv = gl_FragCoord.xy / room_size.xy;
	vec2 uv2 = uv;
	// sine wave
	float tl = (0.5 + sin(time) * 0.5) * l_skew;
	float tR = (0.5 + sin(time) * 0.5) * r_skew;
	
	// warp in x dir
	float dx_l = tl * uv.y;
	float dx_r = tR * uv.y;
	uv2.x = uv2.x * (1. + dx_r) * (1. + dx_l) - dx_l;
	
	//warp in y dir
	float dy_l = tl * (1. - uv.x);
	float dy_r = tR * uv.x;
	uv2.y = uv2.y * (1. + dy_l) * (1. + dy_r);
	
	vec3 col = texture2D(gm_BaseTexture, uv2).rgb;
	
    gl_FragColor = vec4(col, 1.);
}
