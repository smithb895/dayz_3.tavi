waituntil {!isnull (finddisplay 46)}; 
sleep 60;
// Master admin list, includes all admins who should have access to in-game tools menus
_validUIDList = [
	"1234567", // Replace with admin UIDs
	"09876545"
];
if ((getPlayerUID player) in _validUIDList) then { 
player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"awg\tools\Eexcute.sqf","",5,false,true,"",""];
};