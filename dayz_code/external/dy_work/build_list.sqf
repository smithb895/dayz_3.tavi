/*
Build list by Daimyo Client side
Add and remove recipes, Objects(classnames), requirments to build, and town restrictions + extras
This method is used because we are referencing magazines from player inventory as buildables.
Main DEFAULT array (_buildlist) consist of 34 arrays within. These arrays contains parameters for player_build.sqf
From left to right, each array contains 1st: [Recipe Array], 2nd: "Classname", [3rd: Requirements array]. 
Check comments below for more info on parameters
*/
private["_isDestructable","_isSimulated","_disableSims","_objectSims","_objectSim","_requirements","_isStructure","_structure","_wallType","_removable","_buildlist","_build_townsrestrict"];
// Count is 34
// Info on Parameters (Copy and Paste to add more recipes and their requirments!):
//[TankTrap, SandBags, Wires, Logs, Scrap Metal, Grenades], "Classname", [_attachCoords, _startPos, _modDir, _toolBox, _eTool, _medWait, _longWait, _inBuilding, _roadAllowed, _inTown, _removable, _isStructure, _isSimulated, _isDestructable];
_buildlist = [
[[3, 3, 2, 2, 0, 0], "WarfareBDepot",					[[0,18,2], 	[0,15,0], 		90, true, true, false, 	true,  false, false, false, true, true, true, true]],//WarfareBDepot --6
[[4, 1, 2, 2, 0, 0], "Base_WarfareBBarrier10xTall",		[[0,10,1], 	[0,10,0], 		0, 	true, true, false, 	true,  false, false, false, true, false, true, true]],//Base_WarfareBBarrier10xTall --7
[[2, 1, 2, 1, 0, 0], "WarfareBCamp",					[[0,12,1], 	[0,10,0], 		0, 	true, true, false, 	true,  false, false, false, true, true, true, true]],//WarfareBCamp --8
[[2, 1, 1, 1, 0, 0], "Base_WarfareBBarrier10x", 		[[0,10,.6], [0,10,0], 		0, 	true, true, false, 	true,  false, false, false, true, false, true, true]],//Base_WarfareBBarrier10x --9
[[2, 2, 0, 2, 0, 0], "Land_fortified_nest_big", 		[[0,12,1], 	[2,8,0], 		180,true, true, false, 	true,  false, false, false, true, true, true, true]],//Land_fortified_nest_big --10
[[2, 1, 2, 2, 0, 0], "Land_Fort_Watchtower",			[[0,10,2.2],[0,8,0], 		90, true, true, false, 	true,  false, false, false, true, true, true, true]],//Land_Fort_Watchtower --11
[[4, 1, 1, 3, 0, 0], "Land_fort_rampart_EP1", 			[[0,7,.2], 	[0,8,0], 		0, 	true, true, false, 	true,  false, false, false, true, false, true, true]],//Land_fort_rampart_EP1 --12
[[2, 1, 1, 0, 0, 0], "Land_HBarrier_large", 			[[0,7,1], 	[0,4,0], 		0, 	true, true, true,	false, true,  false, true, true, false, true, true]],//Land_HBarrier_large --13
[[2, 1, 0, 1, 0, 0], "Land_fortified_nest_small",		[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, true,  false, true, true, true, true, true]],//Land_fortified_nest_small --14
[[6, 0, 0, 0, 2, 0], "Land_Misc_Cargo2E",				[[0,7,2.6], [0,5,0], 		90, true, false,false, 	true,  false, false, false, true, false, true, true]],//Land_Misc_Cargo2E --15
[[5, 0, 0, 0, 1, 0], "Misc_Cargo1Bo_military",			[[0,7,1.3], [0,5,0], 		90, true, false,false, 	true,  false, false, false, true, false, true, true]],//Misc_Cargo1Bo_military --16
[[3, 0, 0, 0, 1, 0], "Ins_WarfareBContructionSite",		[[0,7,1.3], [0,5,0], 		90, true, false,false, 	true,  false, false, false, true, false, true, true]],//Ins_WarfareBContructionSite --17
[[1, 1, 0, 2, 1, 0], "Land_pumpa",						[[0,3,.4], 	[0,3,0], 		0, 	true, true, true, 	false, false, false, false, true, false, true, true]],//Land_pumpa --18
[[4, 0, 0, 0, 0, 0], "Hhedgehog_concrete",				[[0,5,.6], 	[0,4,0], 		0, 	true, true, false, 	true,  true,  true, true, true, false, true, false]],//Hhedgehog_concrete --19
[[1, 0, 0, 0, 1, 0], "Misc_cargo_cont_small_EP1",		[[0,5,1.3], [0,4,0], 		90, true, false,false, 	false, false, false, false, true, false, true, true]],//Misc_cargo_cont_small_EP1 --20
[[1, 0, 0, 2, 0, 0], "Land_prebehlavka",				[[0,6,.7], 	[0,3,0], 		90, true, false,false, 	false, false, false, false, true, false, true, true]],//Land_prebehlavka(Ramp) --21
[[2, 0, 0, 0, 0, 0], "Fence_corrugated_plate",			[[0,4,.6], 	[0,3,0], 		0,	true, false,false, 	false, false, false, false, true, false, true, true]],//Fence_corrugated_plate --22
[[2, 0, 1, 0, 0, 0], "ZavoraAnim", 						[[0,5,4.0], [0,5,0], 		0, 	true, false,false, 	false, true,  true, true, true, false, true, true]],//ZavoraAnim --23
[[0, 0, 6, 0, 1, 0], "Land_tent_east", 					[[0,8,1.7], [0,6,0], 		0, 	true, false,false, 	true,  true,  false, true, true, true, true, true]],//Land_tent_east --24
[[0, 0, 6, 0, 1, 0], "Land_CamoNetB_EAST",				[[0,10,2], 	[0,10,0], 		0, 	true, false,false, 	true,  false, false, false, true, true, true, true]],//Land_CamoNetB_EAST --25
[[0, 0, 5, 0, 1, 0], "Land_CamoNetB_NATO", 				[[0,10,2], 	[0,10,0],		0, 	true, false,false, 	true,  false, false, false, true, true, true, true]],//Land_CamoNetB_NATO --26
[[0, 0, 4, 0, 1, 0], "Land_CamoNetVar_EAST",			[[0,10,1.2],[0,7,0], 		0, 	true, false,true, 	false, false, false, false, true, false, true, true]],//Land_CamoNetVar_EAST --27
[[0, 0, 3, 0, 1, 0], "Land_CamoNetVar_NATO", 			[[0,10,1.2],[0,7,0], 		0, 	true, false,true, 	false, false, false, false, true, false, true, true]],//Land_CamoNetVar_NATO --28
[[0, 0, 2, 0, 1, 0], "Land_CamoNet_EAST",				[[0,8,1.2], [0,7,0], 		0, 	true, false,true, 	false, false, false, false, true, false, true, true]],//Land_CamoNet_EAST --29
[[0, 0, 1, 0, 1, 0], "Land_CamoNet_NATO",				[[0,8,1.2], [0,7,0], 		0, 	true, false,true, 	false, false, false, false, true, false, true, true]],//Land_CamoNet_NATO --30
[[0, 0, 2, 2, 0, 0], "Fence_Ind_long",					[[0,5,.6], 	[-4,1.5,0], 	0, 	true, false,true, 	false, false, false, false, true, false, true, true]], //Fence_Ind_long --31
[[0, 0, 2, 0, 0, 0], "Fort_RazorWire",					[[0,5,.8], 	[0,4,0], 		0, 	true, false,false, 	false, true,  false, true, true, false, true, true]],//Fort_RazorWire --32
[[0, 0, 2, 0, 0, 0], "Fence_Ind",  						[[0,4,.7], 	[0,2,0], 		0, 	true, false,false, 	false, false, false, true, true, false, true, true]], //Fence_Ind 	--33
[[0, 2, 0, 0, 0, 0], "Land_fort_bagfence_long", 		[[0,4,.3], 	[0,2,0], 		0, 	true, true, false, 	false, true,  false, true, true, false, true, true]],//Land_fort_bagfence_long --34
[[0, 1, 0, 0, 1, 1], "Grave", 							[[0,2.5,.1],[0,2,0], 		0, 	true, true, true, 	false, true,  true, true, true, false, true, false]],//Booby Traps --35
[[2, 0, 0, 3, 1, 0], "Concrete_Wall_EP1", 				[[0,5,1.75],[0,2,0], 		0, 	true, false,true, 	false, true,  true, true, true, false, true, false]],//Gate Concrete Wall --38
[[1, 0, 1, 0, 1, 0], "Infostand_2_EP1",					[[0,2.5,.6],[0,2,0], 		0, 	true, false,true, 	false, true,  false, true, true, false, false, false]],//Gate Panel w/ KeyPad --39
[[0, 1, 1, 0, 0, 0], "Land_BagFenceRound",				[[0,4,.5], 	[0,2,0], 		180,true, true, false, 	false, true,  false, true, true, false, true, true]],//Land_BagFenceRound --40
//[[2, 1, 0, 1, 0, 0], "DeerStand",						[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, true,  false, true, true, true, true, false]],//DeerStand --42
[[1, 0, 0, 0, 0, 0], "Land_CncBlock",					[[0,3,.4], 	[0,2,0], 		0, 	true, false,false, 	false, true,  true, true, true, false, true, true]],//Land_CncBlock --43
//[[0, 2, 0, 0, 0, 0], "SandBagNest", 					[[0,4,.3], 	[0,2,0], 		0, 	true, true, false, 	false, true,  false, true, true, false, true, false]],//SandBagNest --45
[[0, 0, 0, 2, 2, 0], "Land_Misc_Scaffolding",			[[0,5,.8], 	[0,4,0], 		0, 	true, false,false, 	false, true,  false, true, true, false, true, true]], //Scaffolding --48
//[[2, 0, 1, 0, 0, 0], "LadderSmall",						[[0,5,.8], 	[0,4,0], 		0, 	true, false,false, 	false, true,  false, true, true, false, true, true]], //LadderSmall --51
//[[1, 0, 1, 0, 0, 0], "Land_ladder_half",				[[0,5,1], 	[0,4,0], 		0, 	true, false,false, 	false, true,  false, true, true, false, true, true]], //Land_ladder_half --54
//[[0, 0, 0, 2, 2, 0], "Land_zastavka_sever",				[[0,5,.5], 	[0,4,0], 		0, 	true, false,false, 	false, true,  false, true, true, false, true, true]], //Land_zastavka_sever --55
[[0, 0, 0, 2, 0, 0], "Paleta1",							[[0,5,.2], 	[0,4,0], 		0, 	true, false,false, 	false, true,  true, true, true, true, true, true]], //Paleta1 --56
[[3, 4, 0, 1, 1, 0], "Land_ConcreteRamp", 				[[0,5,.6],	[0,2,0], 		0, 	true, false,true, 	false, true,  true, true, true, false, true, false]], //Land_ConcreteRamp --57
[[2, 0, 1, 0, 3, 0], "Land_ladderEP1",					[[0,5,1], 	[0,4,0], 		0, 	true, false,false, 	false, true,  true, true, true, false, true, true]], //Land_ladderEP1 --58
[[0, 1, 0, 4, 1, 0], "Land_Misc_deerstand",				[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true, true, true, true]], //Land_Misc_deerstand --59
[[3, 0, 0, 0, 3, 0], "Land_Ind_Shed_01_main", 			[[0,12,7], 	[2,8,7], 		180,true, true, false, 	true,  false, false, false,true, true,  true, false]],// Roof
[[0, 1, 0, 4, 1, 0], "Land_A_Castle_Stairs_A",			[[0,7,.8], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true,  true,  true, true]], //Land_A_Castle_Stairs_A
[[0, 2, 3, 0, 1, 0], "Land_Misc_ConcPipeline_EP1", 		[[0,5,.6],	[0,2,0], 		0, 	true, false,true, 	false, true,  true,  true, true,  false, true, true]], // pipe tube
[[0, 1, 0, 4, 0, 0], "Land_molo_drevo_end",				[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true,  true,  true, true]], // Wooden Dock small
[[0, 1, 0, 5, 0, 0], "Land_Nav_Boathouse_PierL",		[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true,  true,  true, true]], // Long wooden pier
[[0, 1, 0, 5, 0, 0], "Land_Nav_Boathouse_PierT",		[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true,  true,  true, true]], // Wooden pier
[[0, 0, 0, 3, 1, 0], "Land_WoodenRamp",					[[0,7,1], 	[0,3,0], 		90, true, true, true, 	false, false, false, true, true,  true,  true, true]], // Small wooden ramp
[[3, 3, 0, 1, 1, 0], "RampConcrete", 					[[0,5,.6],	[0,2,0], 		0, 	true, false,true, 	false, true,  true,  true, true,  false, true, false]] // Shallow concrete ramp
]; // *** Remember that the last element in array does not get comma *** element in array does not get comma ***

// Build allremovables array for remove action
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_removable = (_buildlist select _i) select _i - _i + 1;
	if (_removable != "Grave") then { // Booby traps have disarm bomb
	allremovables set [count allremovables, _removable];
	};
};
// Build classnames array for use later
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_classname = (_buildlist select _i) select _i - _i + 1;
	allbuildables_class set [count allbuildables_class, _classname];
};

/*
*** Remember that the last element in ANY array does not get comma ***
Notice lines 47 and 62
*/
// Towns to restrict from building in. (Type exact name as shown on map, NOT Case-Sensitive but spaces important)
// ["Classname", range restriction];
// This is an example of Tavi town restrictions!
/* << REMOVE THIS IF YOU WANT TO ENABLE (remove bottom one too!)
_build_townsrestrict = [
["Lyepestok", 1000],
["Sabina", 900],
["Branibor", 600],
["Bilfrad na moru", 400],
["Mitrovice", 350],
["Seven", 300],
["Blato", 300]
];
*/ // << REMOVE THIS IF YOU WANT TO ENABLE (remove top one too!)
// Here we are filling the global arrays with this local list
allbuildables = _buildlist;
allbuild_notowns = _build_townsrestrict;


/*
This Area is for extra arrays that need to be built via above arrays
*/
	//Determine Structure buildables to build structures array
		for "_i" from 0 to ((count _buildlist) - 1) do
		{
			_requirements = (_buildlist select _i) select _i - _i + 2;
			_isStructure = _requirements select 11;
			_structure = (_buildlist select _i) select _i - _i + 1;
			if (_isStructure) then {
			structures set [count structures, _structure];
			};
		};
	
	//Build all buildables (not just walls) for antiWall script
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_wallType = (_buildlist select _i) select _i - _i + 1;
		//Add more exceptions here so that when players get out of vehicles, they wont call anti-wall with these objects
		if (_walltype != "Grave" && _walltype != "Infostand_2_EP1" && _walltype != "Land_pumpa" && _walltype != "ZavoraAnim") then {
		wallarray set [count wallarray, _wallType];
		};
	};
	//Disable physics locally on objects that we dont want moving (for now, gate panel)
	_objectSims = [];
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_requirements = (_buildlist select _i) select _i - _i + 2;
		_isSimulated = _requirements select 12;
		_objectSim = (_buildlist select _i) select _i - _i + 1;
		//Add more exceptions here so that when players get out of vehicles, they wont call anti-wall with these objects
		if (!_isSimulated) then {
		_objectSims set [count _objectSims, _objectSim];
		};
	};
	//Now we have array, lets disable simulation locally on all objects that require it (basically disabling physics for these)
	_disableSims = nearestObjects [player, _objectSims, 30000];
	{
		_x enableSimulation false;
	} foreach _disableSims;