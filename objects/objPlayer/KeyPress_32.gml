if (jump_amount > 0)
{
    vertical_speed = jump_power;
    jump_amount -= 1;

    if (jump_amount == 1)
        audio_play_sound(sfx_jump, 1, false);
    else
        audio_play_sound(sfx_jump_high, 1, false);
}
