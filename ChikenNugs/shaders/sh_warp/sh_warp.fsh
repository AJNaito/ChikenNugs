//
// warping effect to be used for cutscenes -- fish eye warp around mouse position
// slightly modified from https://www.shadertoy.com/view/4s2GRR
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 room_size;
uniform vec2 mouse_position;
uniform float power;

float fishEye(float fov, vec2 uv) {
	float x = uv.x;
	float y = uv.y;
	float z = 1./tan(fov/2.);
	
	float xy_dist = length(uv);
	
	float _b = atan(xy_dist, z);
	float k = 2. * _b / (xy_dist*fov);
	
	return k;
}

/// fix dis faka up latahs
void main()
{
	float fov = 120.0;
	vec2 uv = gl_FragCoord.xy / room_size.xy - (mouse_position.xy / room_size.xy);
	
	float aspect = room_size.x / room_size.y;
	uv.y /= aspect;
	
	float k = fishEye(fov, uv);
	
	vec2 new_UV = vec2(uv.x*k, uv.y * k);
	
	vec3 col = texture2D(gm_BaseTexture, (new_UV + 1.)/2.).rgb;
	
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
