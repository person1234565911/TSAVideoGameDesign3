if (!triggered && place_meeting(x, y, objPlayer)) {
    triggered = true;
    alarm[0] = 5 * room_speed; // 5 seconds
}

