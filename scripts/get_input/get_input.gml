///get_input()

if !gamepad_is_connected(0) { //If kb/m input
	left_input = (keyboard_check(ord("A"))) or (keyboard_check(vk_left));
	right_input = (keyboard_check(ord("D"))) or (keyboard_check(vk_right));
	jump_input = keyboard_check_pressed(vk_space);
	down_input = (keyboard_check(ord("S"))) or (keyboard_check(vk_down));
	up_input = (keyboard_check(ord("W"))) or (keyboard_check(vk_up));
	action_input = mouse_check_button_pressed(mb_left);
}