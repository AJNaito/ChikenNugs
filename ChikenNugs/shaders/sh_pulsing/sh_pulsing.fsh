//
// Simple pulse effect -- slightly modified from Shadertoy (https://www.shadertoy.com/view/clXXDl)
// idk, thought it looked kewl
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float red, blue, green;
uniform vec2 room_size;

mat2 rotate2D(float factor) {
	return mat2(cos(factor), sin(factor), -sin(factor), cos(factor));
}

void main()
{
	// normalize frag coordinates 
	vec2 uv_coord = (gl_FragCoord.xy - .5*room_size.xy)/room_size.y;
	vec3 color = vec3(0);
	
	// pulsing parameters
	vec2 r_n = vec2(0);
	vec2 r_q = vec2(0);
	vec2 uv = uv_coord;
	float d = dot(uv, uv);
	float S = 12.;
	float r_a = 0.;
	mat2 matrix = rotate2D(5.);
	
	for (float r_j = 0.; r_j < 20.; r_j++) {
		uv *= matrix;
		r_n *= matrix;
		r_q = uv * S + time * 4. + sin(time * 4. - d * 6.) * .8 + r_j + r_n;
		r_a += dot(cos(r_q)/S, vec2(.2));
		r_n -= sin(r_q);
		S *= 1.2;
	}
	
	// get color
	color = vec3(mod(time, 256.), 0.1, 0.1) * r_a;// + r_a  - d;
	
	gl_FragColor = vec4(color, 1.);
}
