#include "defines.sqf"
startLoadingScreen ["Insurgency is loading....."];
if(isServer) then
{
	[] call compile preprocessFileLineNumbers "serverinit.sqf";
};
if(!isDedicated) then
{
	[] call compile preprocessFileLineNumbers "serverinit.sqf";
};
endLoadingScreen;