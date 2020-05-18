if (collision_circle(x_center,y_center,radius,obj_player,false,false)) and (obj_player.action_input) and (obj_player.player_state = states.normal) {
	with obj_player do
	{
		//Do all this in one frame
		grapple_instance = other.id;
		grapple_x = grapple_instance.x_center;
		grapple_y = grapple_instance.y_center;
		rope_x = x;
		rope_y = y;
		rope_angle_vel = 0;
		rope_angle = point_direction(grapple_x,grapple_y,x,y);
		rope_length = point_distance(grapple_x,grapple_y,x,y);
		player_state = states.swing;
		hspmemory = hsp; //preserve current speed
	}
	
	
	
} 