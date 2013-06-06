AWG_player = player;
if (isNil "AWG_demiGOD") then
{
	AWG_demiGOD = 0;
};

if (AWG_demiGOD == 0) then
{
	AWG_demiGOD = 1;
    cutText ["AWG_Godmode activated. (No Recoil, No Grass, No reload)", "PLAIN"];
	setterraingrid 50;
	AWG_player setUnitRecoilCoefficient 0;
	player_zombieCheck = {};
	fnc_usec_damageHandler = {};
	fnc_usec_unconscious  = {};
	AWG_player removeAllEventHandlers "handleDamage";
	AWG_player addEventHandler ["handleDamage", {false}];
	AWG_player allowDamage false;
	while {AWG_demiGOD == 1} do
	{
		vehicle AWG_player setVehicleAmmo 1;
	};
} else {
	AWG_demiGOD = 0;
    cutText ["AWG_Godmode Deactivated. (No Recoil, No Grass, No reload)", "PLAIN"];
	setterraingrid 25;
	AWG_player setUnitRecoilCoefficient 1;
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	AWG_player addEventHandler ["handleDamage", {true}];
	AWG_player removeAllEventHandlers "handleDamage";
	AWG_player allowDamage true;
};