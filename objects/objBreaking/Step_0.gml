if (!triggered)
{
    var _player = instance_place(x, bbox_top - 1, objPlayer);
    if (_player != noone)
    {
        triggered = true;
        sprite_index = sBreakingCol;
        image_index = 0;
        image_speed = 1;
        alarm[0] = room_speed * 2.5;
    }
}
