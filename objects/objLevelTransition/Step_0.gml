if (place_meeting(x,y,objPlayer)) {

    if (room == Room1) global.target = Room2;
    if (room == Room2) global.target = Room3;
    if (room == Room3) global.target = Room4;

    TransitionStart(global.target, sqFadeOut, sqFadeIn);
    alarm[0] = waitTime;
}