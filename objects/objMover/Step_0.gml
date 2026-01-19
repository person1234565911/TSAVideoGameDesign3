if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

if (global.player_isDead == true) {
	TransitionStart(target,sqFadeOut,sqFadeIn);
	game_restart()
}