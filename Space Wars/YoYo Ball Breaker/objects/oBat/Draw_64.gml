/// @description Score and lives
display_set_gui_size(544,576)

draw_set_colour(c_black);
draw_rectangle(-1,0,room_width+1,64,false);

draw_set_font(font_0);
draw_set_colour(c_white);
draw_text(10,10,"Score: "+string(oScore.myscore));

for(var i=0;i<Balls;i++){
	draw_sprite(sBall, 0, 15+(sprite_get_width(sBall)*i),35);
}

if(EndOfLevel == true && room!=rLevel3){
	
/// @description  Next Level screen
display_set_gui_size(544,576)
draw_clear(c_black);
draw_set_font(font_0);
draw_set_colour(c_white);
draw_text(200,250,"YAY, Next Level... \n +1 HP");

}

