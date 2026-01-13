// --- INPUT ---
key_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump  = keyboard_check(vk_space) || keyboard_check(vk_up) || keyboard_check(ord("W"));

// Horizontal movement
move = (key_right - key_left) * player_speed_x;

// Apply gravity
player_speed_y += player_grav;

// --- SPRITE ANIMATION ---
if (move != 0) {
    if (!player_jump_check) sprite_index = player_run;
    image_xscale = sign(move);
} else if (!player_jump_check) {
    sprite_index = player_idle;
}

// --- MOVING PLATFORM COLLISION ---
var _movingPlatform = instance_place(x, y + 1, objMovingLR);
if (_movingPlatform != noone) {
    // Stand on top only
    if (bbox_bottom <= _movingPlatform.bbox_top + 1) {
        player_speed_y = 0;
        // Stick to platform movement
        x += objMovingLR.horizontal_pos;
		y += objMovingLR.vertical_pos;
    }
}

// --- VERTICAL COLLISIONS ---
var one_way = instance_place(x, y + player_speed_y, objOneWay);
var one_way_on_top = one_way != noone && bbox_bottom <= one_way.bbox_top + 1;
if (move == 0 and !player_jump_check)
{
	sprite_index = player_idle;
}



one_way = instance_place(x, y + player_speed_y, objOneWay);
one_way_on_top = one_way != noone && self.bbox_bottom <= one_way.bbox_top+1;

if (place_meeting(x, y + player_speed_y, objCollision) || 
    (place_meeting(x, y + player_speed_y, objOneWay) && one_way_on_top)) 
{
    player_speed_y = 0;
    if (player_jump_check) sprite_index = player_land;
	player_speed_y = 0;
	
	
	if (player_jump_check)
	sprite_index = player_land;
}

// --- MOVE AND COLLIDE ---
move_and_collide(move, 0, objCollision);
move_and_collide(0, player_speed_y, objCollision, 8, 0, 0, player_max_fall_speed);

// --- JUMP ---
if (key_jump && (place_meeting(x, y + 1, objCollision) || 
                 place_meeting(x, y + 1, objOneWay) || 
                 place_meeting(x, y + 1, objMovingLR))) 

if (key_space && (place_meeting(x, y + 1, objCollision) or (place_meeting(x, y + 1, objOneWay))))
{
    player_speed_y = player_jump_height;
    player_jump_check = true;
    sprite_index = sPlayerJump;
    image_index = 0;
    audio_play_sound(sfx_jump, 10, false);
}

// --- DEATH ---
if (place_meeting(x, y, objDeath)) {
    audio_play_sound(Sound7, 10, false);
    player_isDead = true;
    game_restart();
}

// --- JUMP PAD ---
if (place_meeting(x, y, objJumpPad)) {
    player_speed_y = player_jump_pad_height;
    audio_play_sound(sfx_jump_high, 10, false);
}
