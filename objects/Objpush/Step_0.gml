key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))

if place_meeting(x,y,objPlayer)
{
    push_check = true
}

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var _vel = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if push_check == true and key_left == true{
   move_and_collide(_hor * moves_speed, _vel * moves_speed, tilemap)  
    if key_left == true {
        alarm[0] = 60
        if alarm[0] >= 0{
           push_check=false 
        }
        else {
            push_check=true
        }
        
    }
}

if push_check == true and key_right == true{
   move_and_collide(_hor * moves_speed, _vel * moves_speed, tilemap)  
    if key_left == true {
        alarm[0] = 120
        if alarm[0] >= 0{
           push_check=false 
        }
        else {
            push_check=true
        }
        
    }
}
if keyboard_check(ord("W"))
{
    push_check = false
}
if keyboard_check(ord("S"))
{
    push_check = false
}
