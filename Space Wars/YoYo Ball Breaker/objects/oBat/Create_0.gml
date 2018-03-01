/// @description start game

// dont make this on the title screen
if(room==rTitleScreen) {
	instance_destroy();
	exit;
}

len = 0;
xSlen = 1;
ySlen = 1;
Balls = 3;
state = 0;

bricks = layer_tilemap_get_id("Bricks");
shadow = layer_tilemap_get_id("Shadows");

EndOfLevel=false;
EndOfGame=false;


//
// Find all metal blocks and assign them 2 hits. All other blocks get 1
//
var found = false;
var ww = tilemap_get_width(bricks);
var hh = tilemap_get_height(bricks);

global.hits = ds_grid_create(ww,hh);


for(var yy=0;yy<hh;yy++){
	for(var xx=0;xx<ww;xx++){
		var t = tilemap_get(bricks,xx,yy) & tile_index_mask;
		var hit = 1;
		if( t==4 )hit = 2;			
		global.hits[# xx,yy] = hit;
	}
}


