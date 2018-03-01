draw_set_font(Default);
draw_set_halign(fa_center);
draw_set_halign(fa_middle);
draw_text(display_get_gui_width()/2,64, "Controls\nPlayer 1: W, A, S, D\nPlayer 2: I, J, K, L\nP (Pause)\n");

//Pause Menu
if(global.paused){
	
	var gui_width   = display_get_gui_width();
	var gui_height	= display_get_gui_height()
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080)
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "Paused");
}

if(Player_One_Dead && !Player_Two_Dead){
	var gui_width   = display_get_gui_width();
	var gui_height	= display_get_gui_height()
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080)
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "Player 2 WON!	\n Do you want to play again \n Y/N");
}
if(Player_Two_Dead && !Player_One_Dead){
	var gui_width   = display_get_gui_width();
	var gui_height	= display_get_gui_height()
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080)
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "Player 1 WON!	\n Do you want to play again \n Y/N");
}

if(Player_Two_Dead && Player_One_Dead){
	var gui_width   = display_get_gui_width();
	var gui_height	= display_get_gui_height()
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	
	display_set_gui_size(1920,1080)
	
	draw_rectangle(0, 0, gui_width,	gui_height, false);
	draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_halign(fa_middle);
	draw_text(gui_width/2, gui_height/2, "Do you want to play again \n Y/N");
}