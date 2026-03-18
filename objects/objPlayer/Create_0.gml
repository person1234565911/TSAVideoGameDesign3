//Create Event

// State Machine
enum PlayerState {
    IDLE,
    RUN,
    JUMP,
    FALL,
    FLASH,
    DEAD
}
global.playerDead = false;
player_speed_x = 2; // Horizontal Speed
player_speed_y = 0; // Vertical Speed
player_grav = 0.35; // Gravity
player_jump_height = -8; // Jump Height
player_jump_check = false; // Jump Checks
player_max_fall_speed = 8; // Capping the fall speed
player_jump_pad_height = -9; // Setting jump pad height
jump_pad_activated = false; // Trigger if the jump pad is activated
breaking = false; // i have no clue honestly
waitTime = 50; // temp
falling = false; // checks if falling
pad_used = false;
transitionStartCheck = false;
flashlightPicked = false;
flashlightFlashing = false;
coldMeter = 100;
vsp = 0;
state = PlayerState.IDLE;
max_speed = 3.75;
acceleration = 0.02;
standing_on = noone;
standing_on_movingP = noone;
ice_friction = 0.98;
normal_friction = 1;
keyReleased = false;


// Animation sprites
player_idle = sPlayerIdle;
player_run = sPlayerRun;
player_jump = sPlayerJump;
player_land = sPlayerLand;
player_fall = sPlayerFalling;