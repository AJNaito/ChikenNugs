//
// warping effect to be used for cutscenes -- fish eye warp around mouse position
// slightly modified from https://www.shadertoy.com/view/4s2GRR
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 room_size;
uniform vec2 mouse_position;
uniform float power;

/// fix dis faka up latahs
void main()
{
	// normalize uv and center around mouse
	vec2 uv = (gl_FragCoord.xy - mouse_position.xy) / room_size.xy;
	uv += .5;
	
	// fish eye
	vec2 fisheye_uv;
	float fisheye = (0.1 + 0.1) * power;
	fisheye_uv.x = (1.0 - uv.y*uv.y) * fisheye * uv.x;
    fisheye_uv.y = (1.0 - uv.x*uv.x) * fisheye * uv.y;
	
	vec3 col = texture2D(gm_BaseTexture, uv - fisheye_uv).rgb;
	
	// Vignetting
    float uvMagSqrd = dot(uv,uv);
    float vignette = 1.0 - uvMagSqrd * fisheye;
    col *= vignette;
	
	
	
	gl_FragColor = vec4(col, 1.);
	
	
	/*
	vec2 normalized = gl_FragCoord.xy/room_size.xy;
	float screen_prop = room_size.x/room_size.y;
	vec2 center = (gl_FragCoord.xy / room_size.xy) - (mouse_position.xy/room_size.xy);
	vec2 d = normalized - center;
	
	float radius = sqrt(dot(d, d));
	float power = (2.0 * 3.141592 / (2.0 * sqrt(dot(center, center))));
	
	float bind = sqrt(dot(center, center));
	vec2 uv = center + normalize(d) * atan(radius - power * 10.) * bind / atan(-power * bind * 10.);
	
	vec3 col = texture2D(gm_BaseTexture, vec2(uv.x, -uv.y * screen_prop)).xyz;
	
    gl_FragColor = vec4(col, 1.);
	*/
}
