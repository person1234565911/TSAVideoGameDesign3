if sprite_index == sPlayerJump
{
image_index = image_number -1 ;
}

if sprite_index == player_land
{
	player_jump_check = false;
	sprite_index = sPlayerIdle;
}