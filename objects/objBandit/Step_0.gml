 if enemySpeedY != 0{
    sprite_index = enemyJump
    enemyFalling = true  
} 
else {
    if state == "Move" sprite_index = enemyRun
    if state == "Idle" sprite_index = enemyIdle 
}   
   
enemySpeedY += grav
if (state == "Move") {
   if (place_meeting(x+enemySpeedX,y,objLedge))
   {
       var rand = irandom_range(0,2)
       if (rand == 1 or rand == 2) {
           while (!place_meeting(x+sign(enemySpeedX),y,objLedge))
           {
               x = x + sign(enemySpeedX)
                
           } 
            enemySpeedX = -enemySpeedX
            image_xscale = sign(enemySpeedX)
        }
      else if rand == 0 {
          state = "Idle"
          timer = 60 * 2
      } 
       
   }else x = x + enemySpeedX
}
else if (state == "Idle") {
    timer--
    
    if (timer <= 0)
    {
        state = "Move"
    }
}


if (place_meeting(x,y + enemySpeedY,objCollision))
{
    while (!place_meeting(x,y+sign(enemySpeedY), objCollision))
    {
        y = y + sign(enemySpeedY)
    }
    enemyFalling = false;
    enemySpeedY = 0    
}
y = y + enemySpeedY