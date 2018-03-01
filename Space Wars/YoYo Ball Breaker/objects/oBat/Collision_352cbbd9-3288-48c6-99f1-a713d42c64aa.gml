/// @description Hit the ball...

// If ball going down....
audio_play_sound(sndHit,1,false);
if( other.dy>0 ){
	other.y = y-3;
}else{
	other.y = y+sprite_get_height(sBat)+3;
}

other.dy = -other.dy;