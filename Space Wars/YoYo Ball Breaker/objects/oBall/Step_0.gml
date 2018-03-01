/// @description Move and bounce the ball around

x += dx;
y += dy;

if( x<(3+16) ) {
	dx = -dx;
	x=3+16;
}else if (x>(room_width-3-16) ){
	dx = -dx;
	x=room_width-3-16;
}else if( y<(64+3+16) ) {
	dy = -dy;
	y=(64+3+16);
}else if (y>(room_height-8) ){
	//dy = -dy;
	//y=room_height-3;
}else
{
	// Check up
	var block = tilemap_get_at_pixel(bricks,x,y-3) & tile_index_mask;
	if( block!=0 ){
		ClearBlock(x,y-3);
		dy = -dy;
	}
	// left
	block = tilemap_get_at_pixel(bricks,x-3,y) & tile_index_mask;
	if( block!=0 ){
		ClearBlock(x-3,y);
		dx = -dx;
	}
	//right
	block = tilemap_get_at_pixel(bricks,x+3,y) & tile_index_mask;
	if( block!=0 ){
		ClearBlock(x+3,y);
		dx = -dx;
	}
	//down
	var block = tilemap_get_at_pixel(bricks,x,y+3) & tile_index_mask;
	if( block!=0 ){
		ClearBlock(x,y+3);
		dy = -dy;
	}
}


