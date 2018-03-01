/// @description Initialize Variables

	// Gravity Constant
	GRAV = 1000;
	
	// Set missile angle to the direction the ship is facing.
	image_angle = objPlayer1.image_angle;
	var Svx = objPlayer1.xVel;
	var Svy = objPlayer1.yVel;
	
	mVx = Svx + 5*(cos(degtorad(image_angle)));
	mVy = Svy + -5*(sin(degtorad(image_angle)));
	
//speed = fireSpeed + (objPlayer1.speed * 2);

//Lifetime of missile when it hits nothing
fireDuration = 150;