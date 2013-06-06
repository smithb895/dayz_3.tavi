pathtoclothing = "wardrobe\clothing\";
EXECscript1 = 'player execVM "'+pathtoclothing+'%1"';
if ((getPlayerUID player) in ["#########"]) then {
wardrobe =
[
	["",true],
		["DayZ Clothing", [2], "#USER:WardrobeDayZ", -5, [["expression", ""]], "1", "1"],
		["Custom Clothing", [3], "#USER:WardrobeCustom", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		
];} else {
wardrobe =
[
	["",true],
		["DayZ Clothing", [2], "#USER:WardrobeDayZ", -5, [["expression", ""]], "1", "1"],
		["Custom Clothing", [3], "#USER:WardrobeCustom", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
};

WardrobeCustom =
[
	["",true],
		["Rocket Uniform", [2],  "", -5, [["expression", format[EXECscript1,"rocket.sqf"]]], "1", "1"],
		["Desert Rocket Uniform", [3],  "", -5, [["expression", format[EXECscript1,"desert_rocket.sqf"]]], "1", "1"],
		["Desert Camo Clothing", [4],  "", -5, [["expression", format[EXECscript1,"desert_clothes.sqf"]]], "1", "1"],
		["Desert Soldier Uniform", [5],  "", -5, [["expression", format[EXECscript1,"desert_soldier.sqf"]]], "1", "1"],
		["Desert Green Uniform", [6],  "", -5, [["expression", format[EXECscript1,"desert_green_soldier.sqf"]]], "1", "1"],
		["US Soldier Uniform", [7],  "", -5, [["expression", format[EXECscript1,"us_soldier.sqf"]]], "1", "1"],
		["Czech Soldier Uniform", [8],  "", -5, [["expression", format[EXECscript1,"czech_soldier.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WardrobeDayZ =
[
	["",true],
		["Male Suvivor", [2],  "", -5, [["expression", format[EXECscript1,"survivor_male.sqf"]]], "1", "1"],
		["Female Suvivor", [3],  "", -5, [["expression", format[EXECscript1,"survivor_female.sqf"]]], "1", "1"],
		["Male Bandit", [4],  "", -5, [["expression", format[EXECscript1,"bandit_male.sqf"]]], "1", "1"],
		["Female Bandit", [5],  "", -5, [["expression", format[EXECscript1,"bandit_female.sqf"]]], "1", "1"],
		["Camo Clothing", [6],  "", -5, [["expression", format[EXECscript1,"camo_clothes.sqf"]]], "1", "1"],
		["Soldier Uniform", [8],  "", -5, [["expression", format[EXECscript1,"soldier.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WardrobeFake =
[
	["",true],
		["Rocket Uniform", [2],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["Desert Rocket Uniform", [3],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["Desert Camo Clothing", [4],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["Desert Soldier Uniform", [5],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["Desert Green Uniform", [6],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["US Soldier Uniform", [7],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["Czech Soldier Uniform", [8],  "", -5, [["expression", format[EXECscript1,"fake.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:wardrobe";