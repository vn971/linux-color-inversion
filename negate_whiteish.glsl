uniform bool invert_color;
uniform float opacity;
uniform sampler2D tex;

void main() {
	float white_bias = 0.13;

	vec4 c = texture2D(tex, gl_TexCoord[0].st);
	if (invert_color) {
		float max = white_bias + 1.0;
		c = vec4((max - c.r) / max, (max - c.g) / max, (max - c.b) / max, c.a);
	}
	c *= opacity;
	gl_FragColor = c;
}
