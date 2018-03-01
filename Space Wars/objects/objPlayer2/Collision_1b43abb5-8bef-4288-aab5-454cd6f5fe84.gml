/// @description Insert description here
	
	// Decrement Health by 1 after each hit
	if(Hp != 0){Hp -= 1;}

	// Play sound and Destroy when Hp is 0
	if(Hp == 0) { 
		audio_play_sound(Explosion, 10, false);
		instance_destroy();
	}