
vsp += grav;

if (place_meeting(x + hsp,y,objCollision))
{
    while (!place_meeting(x+sign(hsp),y, objCollision))
    {
        x = x + sign(hsp)
    }
    push_block_falling = false;
    hsp = 0    
}
x = x + hsp


if (place_meeting(x,y + vsp,objCollision))
{
    while (!place_meeting(x,y+sign(vsp), objCollision))
    {
        y = y + sign(vsp)
    }
    push_block_falling = false;
    vsp = 0    
}
y = y + vsp


if (place_meeting(x - 1, y, objPlayer)) hsp = 2;
else if (place_meeting(x + 1, y, objPlayer)) hsp = -2;
else hsp = 0;