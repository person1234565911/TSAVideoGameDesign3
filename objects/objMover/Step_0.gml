

if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

if (global.playerDead == true) {
	objCamera.x = 320;
	objCamera.y = 474;
	TransitionStart(global.target,sqFadeOut,sqFadeIn);
	alarm[0] = waitTime;

}