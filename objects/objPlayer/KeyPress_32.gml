// Make the player jump only if it has collided on the ground
if (on_ground)
{
    vertical_speed = jump_power;
    on_ground = false;
}
