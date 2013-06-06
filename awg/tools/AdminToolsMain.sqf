pathtotools = "awg\tools\tools\";
pathtoskins = "awg\tools\skins\";
//pathtoweapon = "awg\tools\weaponkits\";
pathtoshields = "awg\tools\shields\";
EXECscript1 = 'player execVM "'+pathtotools+'%1"';
EXECscript2 = 'player execVM "'+pathtoskins+'%1"';
//EXECscript3 = 'player execVM "'+pathtoweapon+'%1"';
EXECscript4 = 'player execVM "'+pathtoshields+'%1"';
_validUIDList = [
	"1234567", // Replace with admin UIDs
	"09876545"
];
if ((getPlayerUID player) in _validUIDList) then { 
// Admins who are specified in _validUIDList above get access to the following menus:
awgmenu =
[
	["",true],
		["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
		["Skins Menu", [3], "#USER:SkinsMenu", -5, [["expression", ""]], "1", "1"],
		//["Weapon Kits", [4], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
		["Shields Menu", [4], "#USER:ShieldMenu", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		
];} else {
// Admins which are not in the above _validUIDList only get access to the following menus:
awgmenu =
[
	["",true],
		["Tools Menu", [2], "#USER:LiteToolsMenu", -5, [["expression", ""]], "1", "1"],
		["Shields Menu", [3], "#USER:ShieldMenu", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
};

ToolsMenu =
[
	["",true],
		["ESP / Tele", [2],  "", -5, [["expression", format[EXECscript1,"awg_dayzesp.sqf"]]], "1", "1"],
		["God Mode", [3],  "", -5, [["expression", format[EXECscript1,"awg_Godmode.sqf"]]], "1", "1"],
		["Car God", [4],  "", -5, [["expression", format[EXECscript1,"awg_cargod.sqf"]]], "1", "1"],
		["Heal Player(s)", [5],  "", -5, [["expression", format[EXECscript1,"healp.sqf"]]], "1", "1"],
		//["Look-N-Repair", [6],  "", -5, [["expression", format[EXECscript1,"looknrepair.sqf"]]], "1", "1"],
		["Repair Buildings", [6],  "", -5, [["expression", format[EXECscript1,"fixbuildings.sqf"]]], "1", "1"],
		["Spectate Player", [7],  "", -5, [["expression", format[EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

LiteToolsMenu =
[
	["",true],
		["Spectate Player", [2],  "", -5, [["expression", format[EXECscript1,"spectate.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

SkinsMenu =
[
	["",true],
		["Hero", [2],  "", -5, [["expression", format[EXECscript2,"Hero.sqf"]]], "1", "1"],
		["Camo", [3],  "", -5, [["expression", format[EXECscript2,"Camo.sqf"]]], "1", "1"],
		["Ghillie", [4],  "", -5, [["expression", format[EXECscript2,"Ghille.sqf"]]], "1", "1"],
		["Suvivor", [5],  "", -5, [["expression", format[EXECscript2,"Male.sqf"]]], "1", "1"],
		["Soldier", [6],  "", -5, [["expression", format[EXECscript2,"Soldier.sqf"]]], "1", "1"],
		["invisible", [7],  "", -5, [["expression", format[EXECscript2,"invisible.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];


ShieldMenu =
[
	["",true],
		["Zombie Shield", [2],  "", -5, [["expression", format[EXECscript4,"zombieshield.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:awgmenu";