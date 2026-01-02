key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) or keyboard_check(vk_right)
key_space = keyboard_check(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W"));

move = (key_right - key_left) * player_speed_x;
player_speed_y += player_grav;

if (move != 0)
{
	if (!player_jump_check)
	{
		sprite_index = player_run;
	}
	image_xscale = sign(move);
}

if (move == 0 and !player_jump_check)
{
	sprite_index = player_idle;
}



one_way = instance_place(x, y + player_speed_y, objOneWay);
one_way_on_top = one_way != noone && self.bbox_bottom <= one_way.bbox_top+1;

if (place_meeting(x, y + player_speed_y, objCollision)) or 
	(place_meeting(x, y + player_speed_y,objOneWay) && one_way_on_top)
{
	player_speed_y = 0;
	
	
	if (player_jump_check)
	sprite_index = sPLayerLand;
}


move_and_collide(move, 0, objCollision);
move_and_collide(0, player_speed_y, objCollision, 8, 0, 0, player_max_fall_speed);


if (key_space && (place_meeting(x, y + 1, objCollision) or (place_meeting(x, y + 1, objOneWay))))
{
	player_speed_y = player_jump_height;
	image_index = 0;
	player_jump_check = true;
	sprite_index = sPlayerJump;
	


}