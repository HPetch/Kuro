

var _left = bbox_left;
var _top = bbox_top;
var _appscale = surface_get_height(application_surface) / 360;
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);



// create the surface (buffer) we're going to render base water texture to
waterSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(waterSurface);



	// clear the surface to an empty image
    draw_clear_alpha(c_blue,0);

    // disable opacity write (we'll use someone else's opacity later)
    gpu_set_colorwriteenable(true,true,true,false);    

    // draw the game screen, to be used for refraction
    draw_surface_part_ext(application_surface,(_left-_camX)*_appscale,(_top-_camY)*_appscale,sprite_width*_appscale,sprite_height*_appscale,0,0,_appscale,_appscale,c_blue,.9);

    // enable opacity write (we use this alpha to get our shit back)
    gpu_set_colorwriteenable(true,true,true,true);
	
	// make everything below the water visible
	gpu_set_blendmode(bm_add);
	draw_set_color(c_black);
	draw_set_alpha(1.0); // Fiddle with this to get overlays
	// With additive mode enabled, the draw_rectangle is adding zero to RGB color, but 1.0 to alpha.
	// This makes it fully opaque without touching color.
	draw_rectangle(0,transparencyBufferHeight,sprite_width,sprite_height+transparencyBufferHeight,false);
	// go back to normal alpha-blending
	gpu_set_blendmode(bm_normal);

    // draw the main fader color
    draw_set_alpha(0.5);
    draw_set_color($f4bb41);
    draw_rectangle(0,transparencyBufferHeight,sprite_width,sprite_height+transparencyBufferHeight,false);
   
    // draw the top line color
	
	draw_set_alpha(.9)
    draw_set_color($f4eb42);
    draw_line(0,transparencyBufferHeight+1,sprite_width,transparencyBufferHeight+1);
	draw_set_color(c_white);
	draw_line(0,transparencyBufferHeight,sprite_width,transparencyBufferHeight);
	
	// reset draw state
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true,true,true,true);
	
surface_reset_target();

// coords needed for game maker shader hacking
pW = texture_get_texel_width(surface_get_texture(waterSurface));
pH = texture_get_texel_height(surface_get_texture(waterSurface));

// do the wobbly shader effect
resizeSurface = surface_create(sprite_width,sprite_height+transparencyBufferHeight);
surface_set_target(resizeSurface);
	draw_clear_alpha(c_white,0);
	shader_set(shWave);
	shader_set_uniform_f(global.u_pixelH_Wave,pH);
	shader_set_uniform_f(global.u_pixelW_Wave,pW);
	shader_set_uniform_f(global.u_springCount,springCount);
	shader_set_uniform_f_array(global.u_springs,springs);
	shader_set_uniform_f(global.u_time,get_timer()*0.0000025);
	draw_surface(waterSurface,0,0);
	shader_reset();
surface_reset_target();

// draw the final water surface
draw_surface(resizeSurface,_left,_top+transparencyBufferHeight); 
	
surface_free(waterSurface);
surface_free(resizeSurface);