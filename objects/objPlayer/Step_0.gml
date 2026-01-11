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

// Final movement velocity
var _finalMoveX = player_speed_x;
var _finalMoveY = player_speed_y;

// Moving platform collision
var _movingPlatform = instance_place(x, y + max(1, _finalMoveY), objMovingLR);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	// Pixel-perfect collisions
	if (_finalMoveY > 0) {
		while (!place_meeting(x, y + sign(_finalMoveY), objMovingLR)) {
			y += sign(_finalMoveY);
		}
	
		_finalMoveY = 0;
		player_speed_y = 0; // So the gravity is reset too
	}
	
	// Add velocity
	x += _movingPlatform.moveX;
	y += _movingPlatform.moveY;
}
//Collisions
one_way = instance_place(x, y + player_speed_y, objOneWay);
one_way_on_top = one_way != noone && self.bbox_bottom <= one_way.bbox_top+1;

if (place_meeting(x, y + player_speed_y, objCollision)) or 
	(place_meeting(x, y + player_speed_y,objOneWay) && one_way_on_top)
{
	player_speed_y = 0;
	
	
	if (player_jump_check)
	sprite_index = player_land;
}


move_and_collide(move, 0, objCollision);
move_and_collide(0, player_speed_y, objCollision, 8, 0, 0, player_max_fall_speed);


if (key_space && (place_meeting(x, y + 1, objCollision) or (place_meeting(x, y + 1, objOneWay) or place_meeting(x, y + 1, objMovingLR))))
{
	player_speed_y = player_jump_height;
	image_index = 0;
	player_jump_check = true;
	sprite_index = sPlayerJump;
	audio_play_sound(sfx_jump,10,false);


}

//Death
if (place_meeting(x,y,objDeath))
{
	audio_play_sound(Sound7,10,false);
	player_isDead = true;
	game_restart();
}

if (place_meeting(x,y,objJumpPad))
{
	jump_pad_activated = true;
	player_speed_y = player_jump_pad_height;
	audio_play_sound(sfx_jump_high,10,false);
	jump_pad_activated = false;
}