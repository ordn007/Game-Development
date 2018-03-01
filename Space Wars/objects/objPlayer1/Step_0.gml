var xAcc = 0;
var yAcc = 0;

/*moving*/
	image_angle += (keyboard_check(ord("A")) - keyboard_check(ord("D"))) * 3;

	if(keyboard_check(ord("W"))){
		xAcc= THURST_CONSTANT* cos( degtorad(image_angle));
		yAcc= -THURST_CONSTANT* sin( degtorad(image_angle));
		image_index = 1 - image_index ;
		
		//Spd = motion_add(image_angle, velocity);
		if(Thrust_Sound == "True" ) {Thrust_Sound = audio_play_sound(thrustSound, 10, true);}
	}
	else {
	// No longer Thrusting so no sound
    audio_stop_sound(thrustSound);
	Thrust_Sound = "True";
	
	// stop the thruster image
	image_index = 0 ;
	}
	
	// Gravity implementation
	var xR = x - objSun.x;
	var yR = y - objSun.y;
	var rMag = sqrt( xR*xR+ yR*yR) ;

	xGravAcc = GRAV * xR/ (rMag*rMag*rMag) ;
	yGravAcc = GRAV * yR/ (rMag*rMag*rMag) ;

	//Increasing the velocity by adding appropriate accelaration
	xVel += xAcc - xGravAcc ;
	yVel += yAcc - yGravAcc;
	

	//Limiting the engine power to have a maximum velocity
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
	attack = keyboard_check(ord("S"));
	if (attack && cooldown < 1) {
		inst = instance_create_layer(x,y,"Bullets",objBullet1);
		audio_play_sound(missile1Sound, 10, false);
		//inst.direction = image_angle + random_range(-4,4);
		//objBullet1.speed = pSpd;
		cooldown = 50;
	}
	cooldown = cooldown -1;
	
/*Collition with sun*/
	if(rMag < 45){
		audio_play_sound(SuckedInSound, 10, false);
		instance_destroy();
		}
