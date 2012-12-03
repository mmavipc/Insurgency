"map_center" setMarkerAlpha 0;
_i = 0;
while{_i != -1} do
{
	_name = format ["protect%1", _i];
	if(((getMarkerPos _name) select 0) != 0) then
	{
		_name setMarkerAlpha 0;
		_i = _i + 1;
	}
	else
	{
		_i = -1;
	};
};

loadScreen("Waiting for server...");
waitUntil {!isNil "readyForClients"};
loadScreen("Loading...");

{
	_mkr = createMarkerLocal [str _x, _x];
	_mkr setMarkerShapeLocal "RECTANGLE"; 
	_mkr setMarkerTypeLocal "SOLID";		
	_mkr setMarkerSizeLocal [50,50]; 
	_mkr setMarkerAlphaLocal 0.2;
	_mkr setMarkerColorLocal "ColorRed";
} forEach coloredGrids;