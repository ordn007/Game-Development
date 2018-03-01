/// @description Initialize Variables

	// Gravity Constant
	GRAV = 1000;
	
	// Set missile angle to the direction the ship is facing.
	image_angle = objPlayer2.image_angle;
	var Svx = objPlayer2.xVel;
	var Svy = objPlayer2.yVel;
	
	mVx = Svx + 5*(cos(degtorad(image_angle)));
	mVy = Svy + -5*(sin(degtorad(image_angle)));
	
//Lifetime of missile when it hits nothing
fireDuration = 150;