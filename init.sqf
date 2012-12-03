//startLoadingScreen ["Insurgency is loading....."]; //disable when debugging so you don't get stuck
if(isServer) then
{
	[] execVM "serverinit.sqf";
};
if(!isDedicated) then
{
	[] call compile preprocessFileLineNumbers "clientinit.sqf";
};
endLoadingScreen;