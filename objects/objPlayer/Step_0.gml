// Setting up key press variables
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_space = keyboard_check(ord("W"));

move = (key_right - key_left) * player_speed_x;
player_speed_y += player_grav;


// Left and right movements
if (move != 0)
{
	if (!player_jump_check)
	{
		sprite_index = player_run;
	}
	image_xscale = sign(move);
}

// Idle animation triggering
if (move == 0 and !player_jump_check)
{
	sprite_index = player_idle;
}

// Moving platform collision
var _movingPlatform = instance_place(x, y + player_speed_y, objMovingLR);

if (_movingPlatform != noone)
{	
    if (bbox_bottom <= _movingPlatform.bbox_top + 1)
    {
        player_speed_y = 0;
		x += _movingPlatform.moveX;
		y += _movingPlatform.moveY;
    }
	if ((bbox_bottom <= _movingPlatform.bbox_top + 1) && player_jump_check == true)
    {
        sprite_index = player_land;
    }
	
}

//Collision related variables
one_way = instance_place(x, y + player_speed_y, objOneWay);
one_way_on_top = one_way != noone && self.bbox_bottom <= one_way.bbox_top+1;
breaking_block = instance_place(x, y + player_speed_y, objBreaking);

// Checking for collisions
if (place_meeting(x, y + player_speed_y, objSolid)) or 
	(place_meeting(x, y + player_speed_y,objOneWay) && one_way_on_top)
{
	player_speed_y = 0;
	
	
	if (player_jump_check){
		sprite_index = player_land;
	}
}


// Actually applying collisions to objSolid
move_and_collide(move, 0, objSolid);
move_and_collide(0, player_speed_y, objSolid, 8, 0, 0, player_max_fall_speed);


// Jumping
var _on_ground =
    place_meeting(x, y + 1, objSolid) ||
    place_meeting(x, y + 1, objOneWay);

if (key_space && _on_ground)
{
    player_speed_y = player_jump_height;
    image_index = 0;
    player_jump_check = true;
    sprite_index = sPlayerJump;
	audio_play_sound(sfx_jump, 10, false);
}

//Death
if (place_meeting(x,y,objDeath))
{
	global.playerDead = true;

}

// Jump Pads
var pad = instance_place(x, y + 1, objJumpPad);

if (pad != noone && !pad.pad_used)
{
	player_speed_y = player_jump_pad_height;
	image_index = 0;

	pad.jump_pad_activated = true;
	pad.pad_used = true;

	audio_play_sound(sfx_jump_high, 11, false);
}

if (pad == noone)
{
	with (objJumpPad)
	{
		pad_used = false;
	}
}





// Falling animation
if (!player_jump_check && player_speed_y > 0 && !_on_ground)
{
    sprite_index = player_fall;
	falling = true
	
	if _on_ground {
		sprite_index = player_land;
		falling = false;
	}
}