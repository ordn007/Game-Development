/// @description Insert description here
// You can write your code in this editor

var xAcc = 0;
var yAcc = 0;
/*Moving*/
	image_angle+=(keyboard_check(ord("J")) - keyboard_check(ord("L"))) * 3;

	if(keyboard_check(ord("I"))){
		//Spd = motion_add(image_angle, velocity);
		xAcc= BOOST_CONSTANT* cos( degtorad(image_angle));
		yAcc= -BOOST_CONSTANT* sin( degtorad(image_angle));
		image_index = 1 - image_index ;
		
		if(Boost_Sound == "True" ) {Boost_Sound = audio_play_sound(boostSound, 10, true);}
	}
	else{
    image_index = 0 ;
    audio_stop_sound(boostSound);
	Boost_Sound = "True";
	}
	
	//Gravity implementation
	var xR = x - objSun.x;
	var yR = y - objSun.y;
	var rMag = sqrt( xR*xR+ yR*yR) ;

	xGravAcc = GRAV * xR/ (rMag*rMag*rMag) ;
	yGravAcc = GRAV * yR/ (rMag*rMag*rMag) ;
	
	//Increasing the velocity by adding appropriate accelaration
	xVel += xAcc - xGravAcc;
	yVel += yAcc - yGravAcc;

	//Velocity has a cap
	if(xVel > MAX_SPEED) {xVel = MAX_SPEED;} 
	if(xVel < -MAX_SPEED) {xVel = -MAX_SPEED;}
	if(yVel > MAX_SPEED) {yVel = MAX_SPEED;} 
	if(yVel < -MAX_SPEED) {yVel = -MAX_SPEED;}

	//Apply the velocity to image position
	x += xVel;
	y += yVel;

	//wrap around the map
	move_wrap(true,true, sprite_xoffset);

/*shoot*/
	attack = keyboard_check(ord("K"));
	if (attack && cooldown < 1) {
		inst = instance_create_layer(x,y,"Bullets",objBullet2);
		audio_play_sound(missile2Sound, 10, false);
		inst.direction = image_angle + random_range(-4,4);
		cooldown = 50;
	}
	cooldown --;
	
/*Collition with sun*/
	if(rMag < 45){
		audio_play_sound(SuckedInSound, 10, false);
		instance_destroy();
		}
