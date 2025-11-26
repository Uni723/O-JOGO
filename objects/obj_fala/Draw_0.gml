var largura = linha_max;
var altura = 48;

var left   = x - largura/2;
var top    = y - altura;
var right  = x + largura/2;
var bottom = y;

// caixa preta
draw_set_color(c_black);
draw_set_alpha(0.90);
draw_rectangle(left, top, right, bottom, false);

// borda branca
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(left, top, right, bottom, true);

// texto branco
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// se quiser usar fonte undertale, descomente:
// draw_set_font(fnt_undertale);

draw_text(x, y - altura/2, texto_atual);
