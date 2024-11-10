vida_max = 1;
vida_atual = vida_max;
leva_dano = function(_dano){
	if (_dano == undefined) vida_atual -=1;
	else vida_atual -=_dano;
}