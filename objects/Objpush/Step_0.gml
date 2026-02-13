


if place_meeting(x,y,objPlayer)
{
    push_check = true
}

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var _vel = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if push_check == true{
   move_and_collide(_hor * moves_speed, _vel * moves_speed, tilemap)  
}


    
