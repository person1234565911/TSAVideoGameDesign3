// Apply gravity for this object
vertical_speed += grav;

// left-right movement system
if (!place_meeting(x + horizontal_speed, y, Object1))
{
    x += horizontal_speed;
}

// Jumping and vertical movement system
if (place_meeting(x, y + vertical_speed, Object1))
{
    while (!place_meeting(x, y + sign(vertical_speed), Object1))
    {
        y += sign(vertical_speed);
    }
    vertical_speed = 0;
    on_ground = true;
}
else
{
    y += vertical_speed;
    on_ground = false;
}

// checks if any keys are pressed. If not, then stop all movement
if (!keyboard_check(vk_right) && !keyboard_check(vk_left))
{
    horizontal_speed = 0;
}
