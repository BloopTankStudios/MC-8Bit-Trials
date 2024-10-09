#version 150

#moj_import <fog.glsl>
#moj_import <color_effect.glsl>
#moj_import <dither_effect.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

in vec3 pos_;
in vec3 norm_;
in float lightLevel_;

out vec4 fragColor;

void main() {
    vec4 color = applyColoring(texture(Sampler0, texCoord0)) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }

    if (color.a > .5)
        color = applyDither(color, pos_, norm_, lightLevel_);
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
