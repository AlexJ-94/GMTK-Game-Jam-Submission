/// @description Insert description here
// You can write your code in this editor
if(point_distance(obj_carl.x,x,obj_carl.y,y) = 10){
	if (keyboard_check_pressed(vk_tab)){
		keyboard_clear(vk_tab);
		currplayer = true;
		instance_destroy(obj_carl);
		sprite_index = spr_seaweed;
		together = true;
	}		
}

if(together){
	if (keyboard_check_pressed(vk_tab)){
		keyboard_clear(vk_tab);
		instance_create_layer(x, y, "layer_characters",obj_carl)
		currplayer = false;
		obj_carl.currplayer = true;
		together = false;
	}
}