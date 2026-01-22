

if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

if (global.playerDead == true && !transitionStartCheck) {
	objCamera.x = 320;
	objCamera.y = 474;
	transitionStartCheck = true;
	TransitionStart(global.target,sqFadeOut,sqFadeIn);
	
	alarm[0] = waitTime;

}