//startLoadingScreen ["Insurgency is loading....."]; //disable when debugging so you don't get stuck
if(isServer) then
{
	[] call compile preprocessFileLineNumbers "serverinit.sqf";
};
if(!isDedicated) then
{
	[] call compile preprocessFileLineNumbers "clientinit.sqf";
};
endLoadingScreen;