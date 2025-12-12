/// oOstra - Collision with oShoot

// Se estiver invencível, só destrói o projétil
if (invencivel) {
    with (other) instance_destroy();
    exit;
}

// Garantir que a variável vida existe
if (!variable_instance_exists(id, "vida"))
    vida = 3;

// Descobrir o dano do projétil (seguro)
var dano = 1;
if (variable_instance_exists(other, "dano")) dano = other.dano;
if (variable_instance_exists(other, "damage")) dano = other.damage;

// Aplicar dano
vida -= dano;

// Ativar tremida
shake_time = 6;

// Se morrer
if (vida <= 0) instance_destroy();


// Destruir o projétil (SEMPRE usar "with (other)"!)
with (other) instance_destroy();
shake_time = 6; // treme por 6 frames

