//
// ASCII Shader - heavily based on shadertoy.com code. Almost same with minor optimizations
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform mediump float zoom;
uniform vec2 room_size;

float character(int id, int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, in ivec2 pos, float cha) {
	if (id == int(pos.y)) { 
		int pa = p0 + 2*(p1+2*(p2+2*(p3+2*(p4+2*(p5+2*(p6+2*(p7)))))));
		return floor(mod(float(pa)/pow(2., float(pos.x)-1.),2.));
	}
	
	return cha;
}

void main()
{
	vec2 ts = vec2(8. * (1./room_size.x), 12.*(1./room_size.y));
	vec2 uv = vec2(ts.x * floor(v_vTexcoord.x/ts.x),
						ts.y * floor(v_vTexcoord.y/ts.y));
	
	//vec2 uv = vec2(floor(v_vTexcoord.x/8./zoom)*8.*zoom, floor(v_vTexcoord.y/12./zoom)*12.*zoom)/room_size;
	ivec2 pos = ivec2(mod(gl_FragCoord.x/zoom, 8.), mod(gl_FragCoord.y/zoom, 12.));
	
	vec4 pixCol = texture2D(gm_BaseTexture, uv);
	//gl_FragColor = pixCol;
	
	float gray = dot(pixCol.rgb, vec3(.299, .587, .114));
	float cha = 0.;
	
	if (gray < .125) {
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(9, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(8, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(7, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(6, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(5, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(4, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(3, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(2, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .25) { // .
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(9, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(8, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(7, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(6, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(5, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(4, 0, 0, 0, 1, 1, 0, 0, 0, pos, cha);
		cha = character(3, 0, 0, 0, 1, 1, 0, 0, 0, pos, cha);
		cha = character(2, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .375) { //, 
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(9, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(8, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(7, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(6, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(5, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(4, 0, 0, 0, 1, 1, 0, 0, 0, pos, cha);
		cha = character(3, 0, 0, 0, 1, 1, 0, 0, 0, pos, cha);
		cha = character(2, 0, 0, 0, 0, 1, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .5) { // -
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(9, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(8, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(7, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(6, 1, 1, 1, 1, 1, 1, 1, 0, pos, cha);
		cha = character(5, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(4, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(3, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(2, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .625) { // +
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(9, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(8, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(7, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(6, 1, 1, 1, 1, 1, 1, 1, 0, pos, cha);
		cha = character(5, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(4, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(3, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(2, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .75) { // *
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(9, 1, 0, 0, 1, 0, 0, 1, 0, pos, cha);
		cha = character(8, 0, 1, 0, 1, 0, 1, 0, 0, pos, cha);
		cha = character(7, 0, 0, 1, 1, 1, 0, 0, 0, pos, cha);
		cha = character(6, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(5, 0, 0, 1, 1, 1, 0, 0, 0, pos, cha);
		cha = character(4, 0, 1, 0, 1, 0, 1, 0, 0, pos, cha);
		cha = character(3, 1, 0, 0, 1, 0, 0, 1, 0, pos, cha);
		cha = character(2, 0, 0, 0, 1, 0, 0, 0, 0, pos, cha);
		cha = character(1, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else if (gray < .875) { // #
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10,0,0,1,0,0,1,0,0, pos, cha);
		cha = character(9,0,0,1,0,0,1,0,0, pos, cha);
		cha = character(8,1,1,1,1,1,1,1,0, pos, cha);
		cha = character(7,0,0,1,0,0,1,0,0, pos, cha);
		cha = character(6,0,0,1,0,0,1,0,0, pos, cha);
		cha = character(5,0,1,0,0,1,0,0,0, pos, cha);
		cha = character(4,0,1,0,0,1,0,0, 0, pos, cha);
		cha = character(3,1,1,1,1,1,1,1,0, pos, cha);
		cha = character(2,0,1,0,0,1,0,0,0, pos, cha);
		cha = character(1,0,1,0,0,1,0,0,0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	} else { //@
		cha = character(11, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
		cha = character(10,0,0,1,1,1,1,0,0, pos, cha);
		cha = character(9,0,1,0,0,0,0,1,0, pos, cha);
		cha = character(8,1,0,0,0,1,1,1,0, pos, cha);
		cha = character(7,1,0,0,1,0,0,1,0, pos, cha);
		cha = character(6,1,0,0,1,0,0,1,0, pos, cha);
		cha = character(5,1,0,0,1,0,0,1,0, pos, cha);
		cha = character(4,1,0,0,1,0,0,1,0, pos, cha);
		cha = character(3,1,0,0,1,1,1,1,0, pos, cha);
		cha = character(2,0,1,0,0,0,0,0,0, pos, cha);
		cha = character(1,0,0,1,1,1,1,1,0, pos, cha);
		cha = character(0, 0, 0, 0, 0, 0, 0, 0, 0, pos, cha);
	}
	
	vec3 col = pixCol.rgb/max(pixCol.r, max(pixCol.g, pixCol.b));
	gl_FragColor = vec4(cha * col, pixCol.a);
	//gl_FragColor = vec4(intensity * pixelColor.rgb, pixelColor.a);
}