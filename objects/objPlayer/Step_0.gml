if (global.playerDead) exit;
// Setting up key press variables
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_space = keyboard_check(ord("W"))
key_flashlight = keyboard_check_pressed(ord("F"));

move = (key_right - key_left) * player_speed_x;
player_speed_y += player_grav;


if (standing_on != noone)
{
    if (instance_exists(standing_on))
    {
        x += standing_on.x - standing_on.xprevious;
        y += standing_on.y - standing_on.yprevious;
    }
    else
    {
        standing_on = noone;
    }
}

if (standing_on_movingP != noone)
{
    if (instance_exists(standing_on_movingP))
    {
        x += standing_on_movingP.x - standing_on_movingP.xprevious;
        y += standing_on_movingP.y - standing_on_movingP.yprevious;
    }
    else
    {
        standing_on_movingP = noone;
    }
}

// Room checks
if room == Room3 {
    coldMeter -= 0.083;
    // Campfire Checks
    if place_meeting(x, y, objCampfire)
    {
        coldMeter += 0.5;
    }
}
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
var _movingPlatform = instance_place(x, y + player_speed_y + 1, objMovingLR);

if (_movingPlatform != noone && player_speed_y >= 0)
{	
    if (bbox_bottom <= _movingPlatform.bbox_top + 1)
    {
        player_speed_y = 0;
		y = _movingPlatform.bbox_top - (bbox_bottom - y);
        standing_on_movingP = _movingPlatform;
    }
	if ((bbox_bottom <= _movingPlatform.bbox_top + 1) && player_jump_check == true)
    {
        sprite_index = player_land;
    }
	
}
else { 
    if (!place_meeting(x, y + 1, objMovingLR))
    {
        standing_on_movingP = noone;
    }
}
// Rotating platforms collision
var _rotatingPlatform = instance_place(x, y + player_speed_y + 1, objRotatingPlatform);

if (_rotatingPlatform != noone && player_speed_y >= 0)
{
    if (bbox_bottom <= _rotatingPlatform.bbox_top + 1)
    {
        player_speed_y = 0;
        y = _rotatingPlatform.bbox_top - (bbox_bottom - y);
        standing_on = _rotatingPlatform;
    }
    if ((bbox_bottom <= _rotatingPlatform.bbox_top + 1) && player_jump_check == true)
    {
        sprite_index = player_land;
    }
}
else
{
    if (!place_meeting(x, y + 1, objRotatingPlatform))
    {
        standing_on = noone;
    }
}
// On ground
var _on_ground =
    place_meeting(x, y + 1, objSolid) ||
    place_meeting(x, y + 1, objOneWay) ||
    place_meeting(x, y + 1, objRotatingPlatform) ||
    place_meeting(x, y + 1, objMovingLR);

    

// Ice physics
var _iceCOl = instance_place(x, y + 1, objIce);
var _friction = 0.05

if _iceCOl != noone {
    if (key_left) {
        player_speed_x /= ice_friction
        if player_speed_x >= 3.4 player_speed_x = 3.4
        keyReleased = false
    }
    else if (key_right) {
        player_speed_x /= ice_friction
        if player_speed_x >= 3.4 player_speed_x = 3.4
        keyReleased = false
    }
    if (move == 0 && player_speed_x > 0) {
        player_speed_x -= 0.01
        x += player_speed_x
    }
} else if _iceCOl == noone  {
    player_speed_x = 2
    player_speed_x *= normal_friction
}


//Collision related variablesaaaa
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
move_and_collide(move, 0, [objSolid]);
move_and_collide(0, player_speed_y, [objSolid], 8, 0, 0, player_max_fall_speed);

if (player_speed_y < 0)
{
    standing_on = noone;
}
// Jumping

if (key_space && _on_ground)
{
    player_speed_y = player_jump_height;
    image_index = 0;
    player_jump_check = true;
    sprite_index = sPlayerJump;
	audio_play_sound(sfx_jump, 10, false);
}



// Jump Pads
var _jumpPad = instance_place(x, y + 1, objJumpPad);

if (_jumpPad != noone && !_jumpPad.pad_used)
{
	player_speed_y = player_jump_pad_height;
	image_index = 0;

	_jumpPad.jump_pad_activated = true;
	_jumpPad.pad_used = true;

	audio_play_sound(sfx_jump_high, 11, false);
}

if (_jumpPad == noone)
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

// Flashlights
if (place_meeting(x, y, objFlashlight) and flashlightPicked == false){
    flashlightPicked = true
    
}
if flashlightPicked = true {
   if flashlightFlashing == false and key_flashlight {
       flashlightFlashing = true
   }
   else if flashlightFlashing == true and key_flashlight {
       flashlightFlashing = false
   }
}

//Death
if (place_meeting(x,y,objDeath) || place_meeting(x,y,objBandit) || coldMeter <= 0)
{
	if (!transitionStartCheck && !global.playerDead)
    {
        transitionStartCheck = true;
        global.playerDead = true;
        TransitionStart(global.target, sqFadeOut, sqFadeIn);
        alarm_set(0, 16);
    }
}

