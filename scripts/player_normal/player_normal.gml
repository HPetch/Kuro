walljumpdelay = max(walljumpdelay-1,0); //Countdown before control is given back to the player to ensure some momentum is shown when wall jumping
if walljumpdelay = 0 {
	hsp += move * hsp_accel;
	if move = 0 {
		var hsp_friction_final = hsp_friction_ground;
		if (!hsp_friction_ground) hsp_friction_final = hsp_friction_air;
		hsp = Approach(hsp,0,hsp_friction_final);
	}
	hsp = clamp(hsp, -walkspeed, walkspeed);
}

//Adding wall slide friction to gravity (YOU MAY WANT TO CHANGE THIS TO A MORE SOPHISTICATED SYSTEM SO IT DOESNT FEEL LIKE MOONWALKING ON WALLS AT POINTS)
if !CanWallJump
	vsp = vsp + grav
else
	vsp = vsp + (grav * vsp_friction_wall);


//Jump
var on_ground = place_meeting(x,y+1,par_wall); //Get if the player is on the ground or not

if (on_ground) {
	jumps = jumps_max; //Reset jumps
	coyote_time = coyote_time_init; //Reset coyote time
} 

coyote_time -= 1; //Subtract from coyote time each frame (if we're not on the ground then this value will subtract, if we are on the ground it will always be coyote_time_init - 1)
if (jump_input) {
	
	if CanWallJump { //Deal with walljumping!
		walljumpdelay = walljumpdelay_max;
		
		if move != 0 hsp += -WallJumpKick * move
		else {hsp += -WallJumpKick * WallJumpBackupWhere; WallJumpBackupWhere = -WallJumpBackupWhere}
	   vsp = -(jumpheight);
	   jumps = jumps_max; //Reset jumps
	   
	   hsp_frac = 0;
	} else
	
	
	//Check if this is the first jump / on the ground / checking for coyote time
	if (on_ground) or (coyote_time > 0) {
	//Jump as if on ground
	jumps = 1; //Allow only 1 more jump
    vsp = -jumpheight;
	coyote_time = 0; //We've jumped, no more coyote time	
	
	hsp_frac = 0;
	} else if  (jumps > 0) {
	//Double jump
	jumps = jumps - 1;
    vsp = -jumpheight;
	coyote_time = 0; //We've jumped, no more coyote time
	
	hsp_frac = 0;
	}
}