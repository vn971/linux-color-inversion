uniform bool invert_color;
uniform float opacity;
uniform sampler2D tex;

void main() {
	vec4 c = texture2D(tex, gl_TexCoord[0].st);
	if (invert_color) {
		c = vec4(c.a - c.g * 0.5 - c.b * 0.5, c.a - c.r*0.5 - c.b*0.5, c.a - c.r*0.5 - c.g*0.5, c.a);
	}
	c *= opacity;
	gl_FragColor = c;
}
