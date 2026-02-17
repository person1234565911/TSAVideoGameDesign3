 if enemySpeedY != 0{
    sprite_index = enemyJump  
}    
else{
    if enemySpeedX == 0{
       sprite_index = enemyIdle
   }else sprite_index = enemyRun
}


enemySpeedY += grav
if (place_meeting(x+enemySpeedX,y,objCollision))
{
    while (!place_meeting(x+sign(enemySpeedX),y,objCollision))
    {
        x = x + sign(enemySpeedX)
    }
    enemySpeedX = -enemySpeedX
    image_xscale = sign(enemySpeedX)
    
}

x = x + enemySpeedX
if (place_meeting(x,y + enemySpeedY,objCollision))
{
    while (!place_meeting(x,y+sign(enemySpeedY), objCollision))
    {
        y = y + sign(enemySpeedY)
    }
    enemySpeedY = 0    
}
y = y + enemySpeedY