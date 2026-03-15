creation_cooldown--;
if (creation_cooldown == 0) {
    instance_create_layer(x, y, "Instances", objSnowball); 
    snow_ball_created = true
} else snow_ball_created = false;