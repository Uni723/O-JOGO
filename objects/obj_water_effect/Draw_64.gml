shader_set(sh_water);

var u_time = shader_get_uniform(sh_water, "u_time");
var u_strength = shader_get_uniform(sh_water, "u_strength");
var u_blue = shader_get_uniform(sh_water, "u_blue");

shader_set_uniform_f(u_time, t);
shader_set_uniform_f(u_strength, strength);
shader_set_uniform_f(u_blue, blue);

draw_surface(application_surface, 0, 0);

shader_reset();
