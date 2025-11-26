varying vec2 v_vTexcoord;

uniform float u_time;
uniform float u_strength;
uniform float u_blue;

void main() {
    vec2 uv = v_vTexcoord;

    // --- Distorções suaves da água ---
    float wave1 = sin(uv.y * 40.0 + u_time * 2.0) * 0.004 * u_strength;
    float wave2 = sin(uv.y * 18.0 + u_time * 1.5) * 0.006 * u_strength;
    float wave3 = sin((uv.x + uv.y) * 22.0 + u_time * 1.0) * 0.003 * u_strength;

    uv.x += wave1 + wave2;
    uv.y += wave3;

    vec4 base = texture2D(gm_BaseTexture, uv);

    // ------- EFEITO DE ONDINHAS (CAUSTICS REALISTAS) -------
    float c1 = sin((uv.x * 15.0) + (u_time * 1.6)) * 0.03;
    float c2 = sin((uv.y * 19.0) - (u_time * 1.2)) * 0.03;
    float c3 = sin((uv.x + uv.y) * 12.0 + u_time * 1.0) * 0.02;

    float caustics = (c1 + c2 + c3);
    base.rgb += caustics;

    // --- Azul profundo ---
    vec3 deep_blue = vec3(0.0, 0.08, 0.25) * u_blue;
    base.rgb = mix(base.rgb, base.rgb + deep_blue, 0.95);

    gl_FragColor = base;
}
