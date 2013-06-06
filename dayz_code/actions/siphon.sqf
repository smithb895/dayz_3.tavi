private["_vehicle","_curFuel","_newFuel","_timeLeft","_newFuel"];
_vehicle =cursorTarget;
 
_canSize =getNumber(configFile >> "cfgMagazines" >> "ItemJerrycan" >> "fuelQuantity");
_configVeh =configFile >> "cfgVehicles" >> TypeOf(_vehicle);
_capacity =getNumber(_configVeh >> "fuelCapacity");
_nameType =getText(_configVeh >> "displayName");
_curFuel =((fuel _vehicle) * _capacity);
_newFuel =(_curFuel - _canSize);
 
//if (_newFuel < _capacity * 0) then {_newFuel = 0};
if (_curFuel < _canSize) then {
cutText [format["You cannot siphon less than 20 liters from a vehicle."], "PLAIN DOWN"];
} else {
_newFuel = (_newFuel / _capacity);
 
player removeMagazine "ItemJerrycanEmpty";
player addMagazine "ItemJerrycan";
 
player playActionNow "Medic";
_dis=10;
_sfx = "refuel";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
 
sleep 6;
 
dayzSetFuel = [_vehicle,_newFuel];
dayzSetFuel spawn local_setFuel;
publicVariable "dayzSetFuel";
 
cutText [format["%2 liters of Fuel has been siphoned from %1",_nameType,_canSize], "PLAIN DOWN"];
sleep 1;
 
call fnc_usec_medic_removeActions;
r_action = false;
};