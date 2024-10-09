#version 150

#moj_import <color_effect.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;

in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = applyColoring(texture(Sampler0, texCoord0)) * 2 * vertexColor;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = color * ColorModulator;
}
