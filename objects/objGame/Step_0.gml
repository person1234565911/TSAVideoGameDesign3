if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Restart


if keyboard_check_pressed(ord("R")) {
	
}

// Enemy checks
if (!instance_exists(inst_5D85553E)) {
    instance_destroy(inst_168049E6);
}
