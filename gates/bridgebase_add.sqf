private ["_awg_player","_uidList","_objectAnim"];

_awg_player = player;
_awg_object = bridge_gate1;

// UIDs of players who are allowed gate access at the base under the bridge
_uidList = ["698432","107103558","4345344"];

if (getPlayerUID _awg_player in _uidList) then {
		bgOpen = _awg_player addAction ["Open Gates", "gates\bridgebase_open.sqf"];
		bgClose = _awg_player addAction ["Close Gates", "gates\bridgebase_close.sqf"];
} else {
	while {_awg_player distance _awg_object < 20} do {
		if (isNil "bgUnlocked") then {
			_nul = [] execVM "gates\bridgebase_close.sqf";
			sleep .5;
		};
	};
};

sleep 1;