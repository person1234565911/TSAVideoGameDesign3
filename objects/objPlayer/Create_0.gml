//Jumping and vertical movement variables
vertical_speed = 0;

//Left-right movement system
horizontal_speed = 0;
move_speed = 3;

// Physics variables for gravity and jumping
grav = 0.8;

// Collision check with the ground
on_ground = false;

//Jumping control variables
jump_power = -10;
jump_amount = 2;

// death variables
dist_to_player = point_distance(x, y, xstart, ystart)