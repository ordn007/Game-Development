

	/*Sound loop back*/
	var _pos = audio_sound_get_track_position(bgm);
	if(_pos > total_length){
		audio_sound_set_track_position(bgm, _pos-loop_length);	
	}


if (instance_exists(objPlayer1) && !instance_exists(objPlayer2)) {
	Player_Two_Dead = true;
	if(keyboard_check(ord("Y"))){game_restart();}
			else if(keyboard_check(ord("N"))){game_end();
	}
}
if(instance_exists(objPlayer2) && !instance_exists(objPlayer1)){
	Player_One_Dead = true;
	if(keyboard_check(ord("Y"))){game_restart();}
			else if(keyboard_check(ord("N"))){game_end();}
	}

if( !global.paused && !instance_exists(objPlayer2) && !instance_exists(objPlayer1)){
	Player_One_Dead = true;
	Player_Two_Dead = true;
	if(keyboard_check(ord("Y"))){game_restart();}
			else if(keyboard_check(ord("N"))){game_end();}
	}

//Pause menu
if(keyboard_check_pressed(vk_space)){
    global.paused = !global.paused;
}

if(global.paused){
	instance_deactivate_all(1);
	
}
else{instance_activate_all();}