/// @description Create a new ball

if( EndOfGame ) exit;

// waiting on "fire" to set a ball going
if( state==0 ){
	var i = instance_create_layer(x+16,y-16,"Instances",oBall);
	if( irandom(10)<5 ) i.dx = -i.dx;
	state=1;
}