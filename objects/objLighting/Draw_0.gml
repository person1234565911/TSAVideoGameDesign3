if !surface_exists(surf) {
    var _camw = camera_get_view_width(view_camera[0]);
    var _camh = camera_get_view_height(view_camera[0]);
    surf = surface_create(_camw, _camh);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _camw, _camw, false);
    surface_reset_target();
}
else {
   if (surface_exists(surf)) {
   var _cw = camera_get_view_width(view_camera[0]);
   var _ch = camera_get_view_height(view_camera[0]);
   var _cx = camera_get_view_x(view_camera[0]);
   var _cy = camera_get_view_y(view_camera[0]);
   surface_set_target(surf);
   draw_set_color(c_black);
   draw_set_alpha(0.8);
   draw_rectangle(0, 0, _cw, _ch, 0);
   gpu_set_blendmode(bm_subtract);
   with (objLightParent)
       {
           var _sw = sprite_width / 2;
           var _sh = sprite_height / 2;
           switch(object_index)
           { 
           case objSign:
               draw_sprite_ext(sLight, 0, (x + _sw - _cx) - 24, (y + _sh - _cy) - 24, 0.35, 0.35, 0, c_white, 1);
               break;
           case objFlashlight:
               draw_sprite_ext(sLight, 0, x + _sw - _cx, y + _sh - _cy, 0.25, 0.25, 0, c_white, 1);
               break;
           case objBandit:
               draw_sprite_ext(sLight, 0, x + _sw - _cx, y + _sh - _cy, 0.25, 0.25, 0, c_white, 1);
               break;
           case objFlashlightFlash:
               if objFlashlightFlash.image_alpha == 100 {
                  draw_sprite_ext(sLight, 0, x - _cx, y - _sh - _cy, 1.5, 1.5, 0, c_white, 1);    
               } 
                     
               break;
            case objButton8:
               draw_sprite_ext(sLight, 0, (x + _sw - _cx) - 8, y + _sh - _cy, 0.15, 0.15, 0, c_white, 1);
               break;
            case objPlayer:
                if room == Room4 {
                    draw_sprite_ext(sLight, 0, x + _sw - _cx, y + _sh - _cy,1, 1, 0, c_white, 1);
                }
           }
       }
   gpu_set_blendmode(bm_normal);
   draw_set_alpha(1);
   surface_reset_target();
   draw_surface(surf, _cx, _cy);
}
}