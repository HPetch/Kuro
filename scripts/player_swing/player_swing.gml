/// @desc player_swing(grapplepoint) - snap to a grapple point and modify player movement
/// @arg grapplepoint


//argument0 = grapple point ID to snap to
//Get radius from argument0

var _ropeAngleAcceleration = - max((abs(hspmemory) / 10), 0.2) * dcos(rope_angle);
_ropeAngleAcceleration += (right_input - left_input) * 0.08;

rope_length += (down_input - up_input) * 2;

if (rope_y - grapple_y >= 0) rope_length += 0.5 else rope_length -= 0.7; //Little bit of slip or gravity
rope_length = max(rope_length, 5); //How small the rope can be
rope_length = min(rope_length, grapple_instance.radius + ((bbox_bottom-bbox_top)/2)); //How large the rope can be

rope_angle_vel += _ropeAngleAcceleration;
rope_angle += rope_angle_vel;
rope_angle_vel *= 0.98; //Air friction
rope_x = grapple_x + lengthdir_x(rope_length, rope_angle);
rope_y = grapple_y + lengthdir_y(rope_length, rope_angle);


hsp = rope_x - x;
vsp = rope_y - y;

//If hsp is a decimal between 0 and 1/basically stopped, round to 0 to stop jitteryness of trying to apply a fractional hsp
if (abs(hsp) > 0) and (abs(hsp)) < 1 hsp = 0;


		if jump_input {
			player_state = states.normal;
			grapple_instance = -1;
			vsp = -jumpheight;
		}