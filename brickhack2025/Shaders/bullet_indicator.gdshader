shader_type canvas_item;

uniform vec2 origin;

varying vec2 custom_uv;

void vertex() {
	custom_uv = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(1, 0, 0, 1);
	//vec4 flash_color = vec4(1, 0, 0, 1);
	//vec2 displacement = origin - custom_uv;
	//float dist = sqrt(pow(displacement.x, 2) + pow(displacement.y, 2));
	//if (int(dist) % 50 < 25) {
		//vec4 color = texture(TEXTURE, UV);
		//color.rgb = mix(color.rgb, flash_color.rgb, 1);
		//COLOR = color;
	//}
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
