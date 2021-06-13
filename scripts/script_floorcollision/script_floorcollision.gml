// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_floorcollision(){
	if (place_meeting(x, y + vsp, obj_solid))
	{
		while(!place_meeting(x, y + sign(vsp), obj_solid))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
		if(instance_exists(obj_carl))
		{
			obj_carl.grounded = true;
		}
	}
	else
	{
		if(instance_exists(obj_carl))
		{
			obj_carl.grounded = false;
		}
	}

}