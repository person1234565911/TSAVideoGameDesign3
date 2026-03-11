if (objPlayer.flashlightFlashing) {
    image_alpha = 100;
    image_xscale = sign(objPlayer.move)
    
    if (image_xscale == -1) {
        x = objPlayer.x +7
        y = objPlayer.y -10
    }
   if (image_xscale == 1) {
           x = objPlayer.x -7
           y = objPlayer.y -10 
    }
}
else if (!objPlayer.flashlightFlashing) {
    image_alpha = 0;
}