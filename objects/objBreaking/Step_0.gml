// Step Event
if (!triggered) {
	// check if triggered
    var _player = instance_place(x, y - 1, objPlayer);
    if (_player != noone) && (_player.bbox_bottom <= bbox_top + 1) {
        triggered = true;
        sprite_index = sBreakingCol; 
        image_index = 0;
        image_speed = 1; 
        alarm[0] = room_speed * 2.5;
    }
}

// triggers the solid change
if (triggered) {
    solid = false;
} else {
    solid = true;  
}
