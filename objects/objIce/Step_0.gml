var _playerCol = instance_place(x, bbox_top - 1, objPlayer);
if (_playerCol != noone)
{
    with (objPlayer)
    {
        if (keyboard_check(ord("D")))
        {
            player_speed_x = min(player_speed_x + acceleration, max_speed);
        }
        else if (keyboard_check(ord("A")))
        {
            player_speed_x = max(player_speed_x - acceleration, max_speed);
        }
        else player_speed_x = lerp(player_speed_x, 0, 0.02);
    }
}