function resetGlobals(){
	global.breakingBlockBroken = false
	global.midTransition = false;
	global.roomTarget = -1
	global.player_x = x;
	global.player_y = y;
	global.player_isDead = false;
	global.levelTransition = false;
	global.target = Room1;
}