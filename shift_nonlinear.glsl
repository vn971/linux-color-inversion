uniform bool invert_color;
uniform float opacity;
uniform sampler2D tex;

void main() {
	vec4 c = texture2D(tex, gl_TexCoord[0].st);
	if (invert_color) {
		float bias = 1.5; // The RGB step 254->255 is "bias" more important than 0->1
		float axis_shift = 1.0 / (bias - 1.0);
		float axis_inversion_length = c.a*(axis_shift + 1.0)*(axis_shift + 1.0) + axis_shift*axis_shift;
		c = vec4((c.r+axis_shift)*(c.r+axis_shift), (c.g+axis_shift)*(c.g+axis_shift), (c.b+axis_shift)*(c.b+axis_shift), c.a);
		float shift = axis_inversion_length - min(c.r, min(c.g, c.b)) - max(c.r, max(c.g, c.b));
		c = vec4(shift + c.r, shift + c.g, shift + c.b, c.a);
		c = vec4(sqrt(c.r) - axis_shift, sqrt(c.g) - axis_shift, sqrt(c.b) - axis_shift, c.a);
	}
	c *= opacity;
	gl_FragColor = c;
}
