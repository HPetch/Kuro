///@description EDIT PLAYER VALUES HERE


player_state = states.normal; //State the current player is in
IdleSprite = spr_kuro_idle; //Change these sprites to whatever player sprite currently is being used
RunSprite = spr_kuro_run;
JumpUpSprite = spr_kuro_jump_up;
JumpDownSprite = spr_kuro_jump_down;
WallSlideSprite = spr_kuro_wall_slide;
SwingSprite = spr_kuro_rope_body;
SwingHandObject = obj_rope_hands; //Object to point towards swing rope when that happens
HandXOffset = 2; //Change these values according to the offset of X and Y from the player object's origin to create the arm object - align it with the SwingSprite
HandYOffset = -1;

//Use this if you want the character to have sounds e.g. impacts and so on, or want them disabled. e.g. cutscenes or something
PlaySounds = 1; //bool, 0/1

//IF YOU WANNA TWEAK VALUES, TWEAK THESE!
hsp_accel = 1; //Rate of acceleration
hsp_friction_ground = 0.9; //Horizontal friction
hsp_friction_air = 0.15; //Air friction
vsp_friction_wall = 0.8;//When sliding down a wall, slow the drop by this multiplier
grav = 0.4; //Gravity
walkspeed = 5; //Movement speed
jumpheight = 7; // Height of jump
coyote_time = 10; //Frames to allow jumping after falling off platform
jumps_max = 1; //amount of extra jumps in middair that can be had
walljumpdelay_max = 17; //How many frames after a wall jump should the player regain influence over movement speed
WallJumpKick = 4; //strength of kickoff from wall


//CONTROL THE SOUND VOLUME, MIGHT WANT TO PUT THIS IN A TITLE SCREEN OR CREDITS
PlayerVolume = 1; //decimal 0 to 1, essentially 0% to 100% volume


//PROBABLY IGNORE THIS
hsp = 0;
vsp = 0;
jumps = jumps_max;
hsp_frac = hsp;
coyote_time_init = coyote_time; //Initial coyote_time
move = 0;
rope_x = 0;
rope_y = 0;
grapple_x = 0;
grapple_y = 0;
rope_length = 0;
rope_angle = 0;
rope_angle_vel = 0;
grapple_instance = -1; //Instance ID for when connected to rope swings, set to -1 when there's no connection
hspmemory = 0;
CanWallJump = true;
walljumpdelay = 0;
WallJumpBackupWhere = move;
onground = false;