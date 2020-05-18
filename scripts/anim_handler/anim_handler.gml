//HANDLE ALL PLAYER ANIMATIONS!!!!!!!!!!!!!! also handles sounds because why not

if (move = 0) { //no movement
	if player_state = states.normal {
		if instance_exists(obj_rope_hands) instance_destroy(obj_rope_hands); //Check to destroy a hands object if not in swing state
		//If normal state, assume no movement
		if sprite_index != IdleSprite sprite_index = IdleSprite;
		
		//Apart from jumping
		if onground = 0 { //Jumping sprite
			if vsp < 0 if sprite_index != JumpUpSprite sprite_index = JumpUpSprite; //Jump up
			if vsp > 0 if sprite_index != JumpDownSprite sprite_index = JumpDownSprite; //Jump down
		}
	} else if player_state = states.swing {
		if grapple_instance != -1 { //If there's a point we can point an arm object towards, create it
			}
			if sprite_index != SwingSprite sprite_index = SwingSprite;
			if !instance_exists(obj_rope_hands) instance_create_layer(x+HandXOffset,y+HandYOffset,"Debug",obj_rope_hands);
	}
	
	
	
} else if (move != 0) {
	if move > 0 image_xscale = 1; else image_xscale = -1; //Xscale shifting
	
	//Depending on player state, show different sprites
	switch (player_state) {
	    case states.swing: //Handle swinging and create the objects to point towards the grapplepoint
	        if grapple_instance != -1 { //If there's a point we can point an arm object towards, create it
			}
			if sprite_index != SwingSprite sprite_index = SwingSprite;
			if !instance_exists(obj_rope_hands) instance_create_layer(x+HandXOffset,y+HandYOffset,"Debug",obj_rope_hands);
	        break;
	    default: //Normal state
		//Desroy rope hands if it exists
		if instance_exists(obj_rope_hands) instance_destroy(obj_rope_hands);
		
		//First, if we're in a wall sliding state, do that sprite
		if CanWallJump {
			if (vsp != 0) {
				if sprite_index != WallSlideSprite sprite_index = WallSlideSprite;
				}
			
		} else
		
				if onground = 0 { //Jumping sprite
					if vsp < 0 if sprite_index != JumpUpSprite sprite_index = JumpUpSprite; //Jump up
					if vsp > 0 if sprite_index != JumpDownSprite sprite_index = JumpDownSprite; //Jump down
					
							if walljumpdelay != 0 if hsp > 0 image_xscale = 1 else image_xscale = -1;
					
				} else {
					if sprite_index != RunSprite {
						sprite_index = RunSprite;
						image_index = 0;
					}
				}
	        break;
	}
}