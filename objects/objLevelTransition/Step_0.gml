if (place_meeting(x,y,objPlayer)) {
	
	if (room == Room1) global.target = Room2;
	
	
	TransitionStart(global.target,sqFadeOut,sqFadeIn);
	
}