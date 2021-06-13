/// @description  Main Code for Leroy

// If Carl is not active then exit his code
//if (!currplayer)
//{
//	exit;	
//}


	
if (currplayer){
	if (keyboard_check_pressed(vk_tab)){
		currplayer = false;
		obj_carl.currplayer = true;
		keyboard_clear(vk_tab);
	}

	// right/left movement
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	var hmove = key_right - key_left;
	var vmove = key_down - key_up;
	hsp = hmove * bhsp;
	vsp = vmove * bvsp;

	if (hsp != 0) {
		image_xscale = sign(hsp);
	}

	// actual character movements
	y = y + vsp;
	x = x + hsp;
}
script_floorcollision();