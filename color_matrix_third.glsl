uniform bool invert_color;
uniform float opacity;
uniform sampler2D tex;

void main() {
	vec4 c = texture2D(tex, gl_TexCoord[0].st);
	if (invert_color) {
		c = vec4(c.a + c.r*0.3333 - c.g*0.6666 - c.b*0.6666, c.a - c.r*0.6666 + c.g*0.3333 - c.b*0.6666, c.a - c.r*0.6666 - c.g*0.6666 + c.b*0.3333, c.a);
	}
	c *= opacity;
	gl_FragColor = c;
}