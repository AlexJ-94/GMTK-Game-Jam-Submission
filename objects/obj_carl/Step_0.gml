/// @description Main code for Carl
//if (!currplayer)
//{
//	exit;	
//}
// If Carl is not active then don't allow player to move him
if (currplayer){
	if (keyboard_check_pressed(vk_tab)){
		currplayer = false;
		obj_leroy.currplayer = true;
		keyboard_clear(vk_tab);
		hsp = 0;
		vsp = 0;
		
	}

	// right/left movement
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	var move = key_right - key_left;
	hsp = move * bsp;

	// jumping
	if (keyboard_check_pressed(vk_space))
	{
		goingup = true;
		vsp = initjumpvelocity;
	}
	// this allows quick/floaty jumps
	if (goingup)
	{
		if (vsp >= 0){
			grv = bgrv;	
			goingup = false;	
		}
		else{
			grv = upgrv;
		}
	}
	else{
		grv = bgrv;	
	}
}
//gravity
vsp = vsp - grv;

script_floorcollision();

// animations
if (hsp == 0 and grounded == 1){
	sprite_index = spr_carl_stand;
}
else{
	if (hsp != 0) {
		image_xscale = sign(hsp);
	}
	sprite_index = spr_carl_swim;	
}

// actual character movements
y = y + vsp;
x = x + hsp;

