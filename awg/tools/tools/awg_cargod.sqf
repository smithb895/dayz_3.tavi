AWG_player = player;
titleText ["Cargod enabled","PLAIN DOWN"]; titleFadeOut 4;
while {alive ( vehicle AWG_player )} do 
{
	vehicle AWG_player setfuel 1;
	vehicle AWG_player setvehicleammo 1;
	vehicle AWG_player setdammage 0;
	sleep 0.001;
};