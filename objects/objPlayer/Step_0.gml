key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) or keyboard_check(vk_right)
key_space = keyboard_check(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W"));

if key_left
{
	x += player_speed_x	
}
if key_right
{
	x -= player_speed_x	
}