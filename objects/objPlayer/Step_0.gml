// Horizontal movement
if (keyboard_check(vk_right))
{
    horizontal_speed = 4;
}
else if (keyboard_check(vk_left))
{
    horizontal_speed = -4;
}
else
{
    horizontal_speed = 0;
}

// Move horizontally if no collision
if (!place_meeting(x + horizontal_speed, y, Object1))
{
    x += horizontal_speed;
}

// Applying gravity
vertical_speed += 0.9; 

// Vertical movement and collisions
if (!place_meeting(x, y + vertical_speed, Object1))
{
    y += vertical_speed;
    on_ground = false;
}
else
{
 
    while (!place_meeting(x, y + sign(vertical_speed), Object1))
    {
        y += sign(vertical_speed);
    }
    vertical_speed = 0;
    on_ground = true;
}

// resets jump_amount when collision with the ground occurs
if (on_ground)
{
    jump_amount = 2;
}
