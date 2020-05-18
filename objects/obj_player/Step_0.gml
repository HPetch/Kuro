get_input(); //Get user input
var PrevFrameCouldWJ = CanWallJump; //Store the previous frame if a wall jump was possible. Use it to infer whether to wall jump or not even if no movement keys are held
var y_delta = 0; //For corner collisions


move = right_input - left_input; //Get direction moving

anim_handler(); //Handle animations, image_xscale switching and so on!
//anim_handler also handles sounds!

//Player state stuff to determine how to apply movement
switch (player_state) {
    case states.normal:
		player_normal(); //Execute player normal
        break;
    case states.swing:
	player_swing(grapple_instance);
		break;
}


//Clamp to integer values when using momentum to ensure collisions work ok
hsp += hsp_frac;
hsp_frac = frac(hsp);
hsp -= hsp_frac;

//Horizontal movement
if (place_meeting(x+hsp,y, par_wall)) {
	var y_delta = 0; //Change in y value needed for slops
	while ((place_meeting(x+hsp, y-y_delta, par_wall)) and (y_delta <= abs(1*hsp))) y_delta += 1; //Look for where the next available free space is on the y axis and if we can move to it (abs(1*hsp) is a 45 degree angle, values like 50 or something means 50 pixel angles max)
	if place_meeting(x+hsp, y-y_delta, par_wall) { //If there's still a collision after checking up to the maximum distance we can climb to
		while !place_meeting(x+sign(hsp),y,par_wall) {
			x = x + sign(hsp);
		}
		hsp = 0;
		hsp_frac = 0;
		CanWallJump = true;
			if (player_state == states.swing) {
		rope_angle = point_direction (grapple_x,grapple_y,x,y);
		rope_angle_vel = 0;
	}
	} else {
		y -= y_delta;
		
	}
	
} else CanWallJump = false;
x += hsp;

//Correct and snap to downward slopes
//If there isn't currently a meeting with a wall object, the vsp is positive (NOT JUMPING), and there is at least 2 pixels of space underneath you (something about collisions, thanks @Avyrra on youtube)
if (!place_meeting(x,y,par_wall)) and (vsp >= 0) and (place_meeting(x,y+2+abs(hsp),par_wall)) {
	while (!place_meeting(x,y+1,par_wall)) { //Whilst there is still empty space
		y += 1; //Snap downwards until we are on the slope
	}
	
	if (player_state == states.swing) {
		rope_angle = point_direction (grapple_x,grapple_y,x,y);
		rope_angle_vel = 0;
	}
}

//Vertical movement
if (place_meeting(x,y+vsp, par_wall)) {
	while !place_meeting(x,y+sign(vsp),par_wall) {
		y = y + sign(vsp);
	}
	vsp = 0;
	onground = true;
	if (player_state == states.swing) {
		rope_angle = point_direction (grapple_x,grapple_y,x,y);
		rope_angle_vel = 0;
	}
} else onground = false;
y += vsp;

//Walljump forgiveness so you dont have to jump frame perfect
if PrevFrameCouldWJ = 1 and place_meeting(x-1,y-y_delta,par_wall) or place_meeting(x+1,y-y_delta,par_wall) { //If the player was holding a directional key at some point on the wall and jumps even without the key on it, still walljump
	if !CanWallJump CanWallJump = true;
	if move != 0 WallJumpBackupWhere = move;
}