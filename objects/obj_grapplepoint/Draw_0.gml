draw_self();

//Debug, hide the radius outline 
if keyboard_check_pressed(vk_backspace) {
	debug_hidden = !debug_hidden;
}

if !debug_hidden {
	draw_set_color(c_red);
	draw_circle(x_center,y_center,radius,true); //Draw outline showing radius
	}