var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var _vel = keyboard_check(ord("W")) - keyboard_check(ord("S"))

if objPlayer.x and objPlayer.y = bbox_top
{
    other.x = bbox_top
    other.y = bbox_top
    other.sprite_index = sPlayerIdle
    push_check = false
}