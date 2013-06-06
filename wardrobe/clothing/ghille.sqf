// -------------------------------------------Item Fix Start-------------------------------------------
private["_hasmapitem","_hascompassitem","_haswatchitem"];
_hasmapitem = "ItemMap" in weapons player;
_hascompassitem = "ItemCompass" in weapons player;
_haswatchitem = "ItemWatch" in weapons player;
// -------------------------------------------Item Fix End-------------------------------------------
if (dayz_combat == 1) then {
titleText ["You can't change clothes while in combat.", "PLAIN DOWN", 3];
sleep 5;
titleFadeOut 1;
} else {
titleText ["Changing Clothes...", "PLAIN DOWN", 3];
sleep 3;
[dayz_playerUID,dayz_characterID,'Sniper1_DZ'] spawn player_humanityMorph;
sleep 2;
titleText ["...looking good! Wardrobe closed for 10 minutes.", "PLAIN DOWN", 3];
// -------------------------------------------Item Fix Start-------------------------------------------
if (!_hasmapitem ) then {
    player removeWeapon "ItemMap";
};
if (!_hascompassitem ) then {
    player removeWeapon "ItemCompass";
};
if (!_haswatchitem ) then {
    player removeWeapon "ItemWatch";
};
player removeWeapon "ItemRadio";
// -------------------------------------------Item Fix End-------------------------------------------
sleep 5;
titleFadeOut 1;
sleep 600;
wardrobe = player addaction [("<t color=""#ff8810"">" + ("Wardrobe") +"</t>"),"wardrobe\wardrobe_execute.sqf","",5,false,true,"",""];
};