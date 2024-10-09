#version 150

#moj_import <fog.glsl>
#moj_import <color_effect.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec2 texCoord0;
in vec4 vertexColor;

out vec4 fragColor;

void main() {
    vec4 color = applyColoring(texture(Sampler0, texCoord0)) * vertexColor * ColorModulator;
    color *= vec4(.75, .75, .75, 1.25);
    
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
