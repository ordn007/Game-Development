/// @description Step time of missile

/*Movement*/

	//Wrap missile when off the map
	move_wrap(true,true, sprite_xoffset);

	//Gravity implementation
	var xR = x - objSun.x;
	var yR = y - objSun.y;
	var rMag = sqrt( xR*xR+ yR*yR) ;

	
	xGravAcc = GRAV * xR/ (rMag*rMag*rMag) ;
	yGravAcc = GRAV * yR/ (rMag*rMag*rMag) ;
	
	//Increasing the velocity by adding appropriate accelaration
	mVx -= xGravAcc;
	mVy -= yGravAcc;
	
	// Apply the calculated velocity
	x += mVx;
	y += mVy;
	
	
/*life of missile*/
	if(fireDuration != 0){fireDuration--;}
	if(rMag < 25){instance_destroy();}
	if(fireDuration == 0){instance_destroy();}