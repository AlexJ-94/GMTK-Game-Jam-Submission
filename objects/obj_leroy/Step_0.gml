/// @description  Main Code for Leroy

// If Carl is not active then exit his code
//if (!currplayer)
//{
//	exit;	
//}


	
if (currplayer){
	if(!together){
		if (keyboard_check_pressed(vk_tab)){
			keyboard_clear(vk_tab);
			currplayer = false;
			obj_carl.currplayer = true;
			hsp = 0;
			vsp = 0;
		}
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
}

script_floorcollision();
// animations
if (hsp == 0){
	if(together){
		sprite_index = spr_together_stand;
	}
	else{
		sprite_index = spr_leroy_stand;
	}
	
}
else{
	if(together){
		sprite_index = spr_together_swim;
	}
	else{
		sprite_index = spr_leroy_swim;
	}
	image_xscale = sign(hsp);
}

	// actual character movements
y = y + vsp;
x = x + hsp;


if(!together){
	if(point_distance(obj_carl.x,obj_carl.y,x,y) <= 50){
		if (keyboard_check_pressed(vk_tab)){
			keyboard_clear(vk_tab);
			currplayer = true;
			instance_destroy(obj_carl);
			sprite_index = spr_together_stand;
			together = true;
		}		
	}
}
else{
	if (keyboard_check_pressed(vk_tab)){
		keyboard_clear(vk_tab);
		instance_create_layer(x, y, "carl",obj_carl)
		sprite_index = spr_leroy_stand;
		currplayer = false;
		obj_carl.currplayer = true;
		together = false;
	}
}

