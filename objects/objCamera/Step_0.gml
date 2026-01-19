if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

x += (xTo - x)/25;
y += (yTo - y)/25;

x = clamp(x,camWidth,room_width-camWidth);
y = clamp(y,camHeight,room_height-camHeight);

camera_set_view_pos(cam,x-camWidth,y-camHeight);