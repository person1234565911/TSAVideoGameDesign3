function resetGlobals(){
	// Resetting all of the global variables to their default
	global.breakingBlockBroken = false
	global.midTransition = false;
	global.roomTarget = -1
	global.player_x = x;
	global.player_y = y;
	global.player_isDead = true;
	global.levelTransition = false;
}