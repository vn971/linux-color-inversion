uniform bool invert_color;
uniform float opacity;
uniform sampler2D tex;

/**
 * based on shift.glsl https://github.com/vn971/linux-color-inversion
 */
void main() {
	float white_bias = .17;

	vec4 c = texture2D(tex, gl_TexCoord[0].st);
	if (invert_color) {
		float m = 1.0 + white_bias;
		float shift = white_bias + c.a - min(c.r, min(c.g, c.b)) - max(c.r, max(c.g, c.b));
		c = vec4((shift + c.r) / m, (shift + c.g) / m, (shift + c.b) / m, c.a);
	}
	c *= opacity;
	gl_FragColor = c;
}
