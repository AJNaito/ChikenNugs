//
// ASCII Shader - heavily based on shadertoy.com code. Almost same with minor optimizations
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float resolution
uniform vec2 objectRes

#define asciiSizeX 8.
#define asciiSizeY 12.

void main()
{
	// convert raw coords to pixelated
	vec2 uvPixCoord = vec2(floor((v_vTexcoord.x/asciiSizeX)/resolution) * asciiSizeX * zoom,
							floor((v_vTexcoord.y/asciiSizeY)/resolution) * asciiSizeY * zoom)/objectRes;
							
	// get an absolute position
	ivec2 position = ivec2(mod(v_vTexcoord.x/resolution, asciiSizeX), mod(v_vTexcoord.y/resolution, asciiSizeY));
	
	// get color a pixelated coord
	vec4 pixelColor = texture2D(gm_BaseTexture, uvPixCoord);
	
	// get intensity of the pixel
	float intensity = intensity(pixelColor);
	float character = 0.;
	
	// switch the pixel's value
	if (intensity < .125) {
			// do nothing - empty space
	} else if (intensity < .25) { // character is .
		character = pixelValue(position, 4, 0, 0, 0, 1, 1, 0, 0, 0, character);
		character = pixelValue(position, 3, 0, 0, 0, 1, 1, 0, 0, 0, character);
	} else if (intensity < .375) { // character is ,
		character = pixelValue(position, 4,0,0,0,1,1,0,0,0, character);
        character = pixelValue(position, 3,0,0,0,1,1,0,0,0, character);
        character = pixelValue(position, 2,0,0,0,0,1,0,0,0, character);
        character = pixelValue(position, 1,0,0,0,1,0,0,0,0, character);
	} else if (intensity < .5) { // character is -
		character = pixelValue(position, 6,1,1,1,1,1,1,1,0, character);
	} else if (intensity < 0.625) { // character is +
		character = pixelValue(position, 9,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position, 8,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position, 7,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position, 6,1,1,1,1,1,1,1,0, character);
        character = pixelValue(position, 5,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position, 4,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position, 3,0,0,0,1,0,0,0,0, character);
	} else if (intensity < 0.75) { // character is *
		character = pixelValue(position,10,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position,9,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,8,0,1,0,1,0,1,0,0, character);
        character = pixelValue(position,7,0,0,1,1,1,0,0,0, character);
        character = pixelValue(position,6,0,0,0,1,0,0,0,0, character);
        character = pixelValue(position,5,0,0,1,1,1,0,0,0, character);
        character = pixelValue(position,4,0,1,0,1,0,1,0,0, character);
        character = pixelValue(position,3,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,2,0,0,0,1,0,0,0,0, character);
	} else if (intensity < 0.875) { // character is #
		character = pixelValue(position,10,0,0,1,0,0,1,0,0, character);
        character = pixelValue(position,9,0,0,1,0,0,1,0,0, character);
        character = pixelValue(position,8,1,1,1,1,1,1,1,0, character);
        character = pixelValue(position,7,0,0,1,0,0,1,0,0, character);
        character = pixelValue(position,6,0,0,1,0,0,1,0,0, character);
        character = pixelValue(position,5,0,1,0,0,1,0,0,0, character);
        character = pixelValue(position,4,0,1,0,0,1,0,0,0, character);
        character = pixelValue(position,3,1,1,1,1,1,1,1,0, character);
        character = pixelValue(position,2,0,1,0,0,1,0,0,0, character);
        character = pixelValue(position,1,0,1,0,0,1,0,0,0, character);
	} else { // character is @
		character = pixelValue(position,10,0,0,1,1,1,1,0,0, character);
        character = pixelValue(position,9,0,1,0,0,0,0,1,0, character);
        character = pixelValue(position,8,1,0,0,0,1,1,1,0, character);
        character = pixelValue(position,7,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,6,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,5,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,4,1,0,0,1,0,0,1,0, character);
        character = pixelValue(position,3,1,0,0,1,1,1,1,0, character);
        character = pixelValue(position,2,0,1,0,0,0,0,0,0, character);
        character = pixelValue(position,1,0,0,1,1,1,1,1,0, character);
	}
	
	vec3 col = pixelColor.xyz/max(pixelColor.x, max(pixelColor.y, pixelColor.z));
	gl_FragColor = vec4(character * col, 1.);
}

float pixelValue(ivec2 pos, int id, int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, float char) {
	if (id == pos.y) {
		int pa = p0 + 2*(p1+2*(p2+2*(p3+2*(p4+2*(p5+2*(p6+2*(p7)))))));
		char = floor(mod(float(pa)/pow(2.,float(pos.x)-1.),2.));
	}
	
	return char;
}

float intensity(vec4 pixelColor) {
	return (pixelColor.r * 0.299) + (pixelColor.g * 0.587) + (pixelColor.b * 0.114);
}