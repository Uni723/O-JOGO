if (shake_time > 0) {
    shake_time -= 1;
    x += irandom_range(-shake_power, shake_power);
    y += irandom_range(-shake_power, shake_power);
}
// Quando o boss morrer
