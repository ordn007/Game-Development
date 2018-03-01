/// @description Move bat

x = mouse_x;
if( x>(room_width-(sprite_get_width(sBat)/2)-16) ){
	x=room_width-(sprite_get_width(sBat)/2)-16;
}else if( x<(16+(sprite_get_width(sBat)/2)) ){
	x = 16+(sprite_get_width(sBat)/2);
}

// Check for balls and pickups on the level. If none, then lost a life
if( !instance_exists(oBall) && !instance_exists(oMultiBall) && !instance_exists(oPickup)){
	if( state==1 ){
		state=0;
		Balls--;
		if( Balls==0 ) {
			//End of game
			if( !EndOfGame ){
				EndOfGame=true;
				alarm[2]=120;
			}			
		}
	}
}

// detect end of level - is it empty?
var found = false;
var ww = tilemap_get_width(bricks);
var hh = tilemap_get_height(bricks);
for(var yy=0;yy<hh;yy++){
	for(var xx=0;xx<ww;xx++){
		var t = tilemap_get(bricks,xx,yy) & tile_index_mask;
		if( t!=0 ){
			found=true;
			break;
		}	
	}
	if(found) break;
}

// Was it empty?
if( !found ){
	if( !EndOfLevel ){
		EndOfLevel=true;
		alarm[0]=120;
	}
}
