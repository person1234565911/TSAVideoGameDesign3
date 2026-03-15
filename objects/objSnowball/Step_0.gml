if (instance_exists(self)) {
    vsp += grav;
    if (place_meeting(x + hsp,y,objSolid))
    {
        while (!place_meeting(x+sign(hsp),y, objSolid))
        {
            x = x + sign(hsp)
        }
        hsp = 0    
    }
    x = x + hsp 
    if (place_meeting(x,y + vsp,objSolid))
    {
        while (!place_meeting(x,y+sign(vsp), objSolid))
        {
            y = y + sign(vsp)
        }
        vsp = 0    
    }
    y = y + vsp 
    
}