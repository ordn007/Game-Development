/// @description ClearBlock(x,y)

var xx = (argument0-16)&~31;
var yy = argument1&~15;


// get tile and counter
var count = global.hits[# argument0>>5,argument1>>4]-1;

// extract counter from tile data and decrement hit count
// if tile dead, then clear it!
if( count<=0 )
{
	tilemap_set_at_pixel(bricks,0,argument0,argument1);
	tilemap_set_at_pixel(shadow,0,argument0+16,argument1+16);
	oScore.myscore += 80;

	// drop a pickup?
	if(irandom(100)<20 )
	{	
		var pickup = choose(oPickup,oMultiBall);
		var i = instance_create_layer(xx+16,yy,"Pickups",pickup);	
	}
}else{
	var t = tilemap_get_at_pixel(bricks,argument0,argument1) & tile_index_mask;
	if( t==4 ){
		var i = instance_create_layer(xx+16,yy,"Pickups",oBlockStrike);
	}

	// if tile isn't dead, put new count back....
	global.hits[# argument0>>5,argument1>>4] = count;	
}