// This file is for server specific settings. Refer to the documentation at
// development.dayztaviana.com site for further details.
[0.0, 0.2] call kh_setFogRange;
[0.0, 0.5] call kh_setOvercastRange;
[0.0, 0.4] call kh_setRainRange;
[0.0, 8.0] call kh_setWindRange;

0.2 call kh_setInitialFog;
0.2 call kh_setInitialOvercast;
0.0 call kh_setInitialRain;

//kh_replacementWeatherCode = { [] execVM "my_custom_weather_script.sqf"; };