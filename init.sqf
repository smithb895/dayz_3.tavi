//[] execVM "briefing.sqf"; // Load briefing..
startLoadingScreen ["","DayZ_loadingScreen"];
enableSaving [false, false];
dayZ_instance = 3;	//The instance
hiveInUse	=	true;
initialized = false;
dayz_previousID = 0;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf"; //Initilize the Variables (IMPORTANT: Must happen very early)
// (Taviana) Override some of the variables:
call compile preprocessFileLineNumbers "\kh\dayztaviana\init\variables.sqf";
// Load in the settings compiles:
call compile preprocessFileLineNumbers "\kh\dayztaviana\settingsinit\kh_compiles.sqf";
diag_log "Started executing user settings file.";
call compile preprocessFileLineNumbers "settings.sqf";
diag_log "Finished executing user settings file.";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";	//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf"; //Functions used by CLIENT for medical
progressLoadingScreen 0.4;
// (Taviana) Don't call the regular compile:
// call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //Compile regular functions
// (Taviana) Instead, call a copy of the DayZ 1.7.4.4 compiles:
//call compile preprocessFileLineNumbers "\kh\dayztaviana\init\compiles.sqf"; //Compile regular functions
// Custom Loot Tables
building_spawnLoot = compile preprocessFileLineNumbers "fixes\building_spawnLoot.sqf";
// (Taviana) Set up the for maule multiplayer prop hit support:
call compile preprocessFileLineNumbers "\khr\maule\scripts\maule_init.sqf";
/*
The Bliss package system works a bit like sticking your arm in a bunch
of snake nests and noticing you don't always get bitten. In this case
we got bitten; this line is to fool the merge process:
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //Compile regular functions
*/
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf"; //Initializes custom variables
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf"; //Compile custom compiles, includes base building + salvage mods
call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf"; //Initialize custom clientside settings
progressLoadingScreen 1.0;
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
//enableRadio false;
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
// Fred's Wardrobe
wardrobe = compile preprocessFileLineNumbers "wardrobe\wardrobe_main.sqf";

// atv
//if (!(isNull player)) then
        //{
		//Init Scripting
        //gc_veh_flip_script_script_action_manager = execVM "fixes\action_manager.sqf";
        //};
//if (!isServer && isNull player) then
        //{
        //waitUntil {!isNull player};
        //gc_veh_flip_script_script_action_manager = execVM "fixes\action_manager.sqf";
        //};

if (isServer) then {
	hiveInUse = true;
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};
if (!isDedicated) then {
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED",60];
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	//_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	_playerMonitor = 	[] execFSM "awg\tools\player_monitor.fsm";
	[] execVM "fixes\change_streetlights.sqf";
	[] execVM "fixes\awg_fog.sqf";
};
// Extra actions for Taviana:
if (!isDedicated) then {
	[] execVM "kh_actions.sqf";
	
};
//debriefing=1;
//briefing=1;
execVM "R3F_ARTY_AND_LOG\init.sqf";
[] execVM "awg\tools\Activate.sqf";
// Fred's Wardrobe
[] execVM "wardrobe\wardrobe_activate.sqf";
_nul = [] execVM "gates\bridgebase_close.sqf";