#version 150

vec4 applyDither(vec4 color, vec3 pos, vec3 norm, float lightLevel)
{
    //return vec4(norm.xyz, 1.0);

    pos = mod(floor(pos * 16 + .01), 16);

    if (lightLevel < .8)
    {
        if (mod(pos.x + pos.y + pos.z, 4) == 0 && (mod(pos.x, 2) == 1 || mod(pos.y, 2) == 1 || mod(pos.z, 2) == 1))
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .67)
    {
        if (mod(pos.x + pos.y + pos.z, 2) == 0 && (mod(pos.x, 2) == 1 || mod(pos.y, 2) == 1 || mod(pos.z, 2) == 1))
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .6)
    {
        if (mod(pos.x + pos.y + pos.z, 4) == 0)
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .5)
    {
        if (mod(pos.x + pos.y + pos.z, 2) == 0)
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .4)
    {
        if (mod(pos.x + pos.y + pos.z, 4) == 1 && ((norm.y != 0 && mod(pos.x - pos.z, 4) == 1) || mod(pos.y - pos.x - pos.z, 4) == 1))
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .3)
    {
        if ((norm.z != 0 && mod(pos.x, 2) == 0) || (norm.z == 0 && mod(pos.z, 2) == 0))
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    if (lightLevel < .2)
    {
        if (mod(pos.x - pos.y - pos.z, 4) == 1 || (norm.z == 0 && mod(pos.y - pos.x - pos.z, 4) == 1))
            return vec4(0.0, 0.0, 0.0, 1.0);
        color *= .9;
    }
    return color;
}