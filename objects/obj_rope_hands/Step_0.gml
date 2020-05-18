if obj_player.image_xscale = 1 {
	x = obj_player.x + XOffset;
	y = obj_player.y + YOffset;
} else {
	x = obj_player.x - XOffset;
	y = obj_player.y - YOffset;	
}

if obj_player.left_input
	{image_yscale = -1;} 
	else if obj_player.right_input {image_yscale = 1;}

if obj_player.grapple_instance != -1

//Look as if its swinging along!
if image_yscale = 1 image_angle = point_direction(x,y,obj_player.grapple_instance.x, obj_player.grapple_instance.y) + 40
else image_angle = point_direction(x,y,obj_player.grapple_instance.x, obj_player.grapple_instance.y) - 40