#version 150

#moj_import <hsv.glsl>

vec4 applyColoring(vec4 color)
{
    //return vec4(1.0, 0.0, 0.0, 1.0);
    vec3 hsv = rgb2hsv(vec3(color.rgb));

    //Contrast
    if (hsv.z < .333)
        hsv.z *= .85;
    else if (hsv.z > .666)
        hsv.z += (1 - hsv.z) * .15;

    //Increased Saturation
    hsv.y += .05;

    hsv = hsv2rgb(hsv);
    color = vec4(hsv.rgb, color.a);

    //8-bit registery
    return floor(color * 8) * .125 * vec4(.8, .8, .8, 1.25);
}
