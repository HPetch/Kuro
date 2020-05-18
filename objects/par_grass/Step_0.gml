// Sway Bitch


rsp += sin(current_time * 0.008 + id) * 0.4;



rsp += -image_angle * 0.3; // tension
rsp = lerp(rsp, 0.09, 0.7); // damping

// do sway motion:
image_angle += rsp;


//SWAY

