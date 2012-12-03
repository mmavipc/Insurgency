loadScreen("Waiting for server...");
waitUntil {!isNil "readyForClients"};
loadScreen("Loading...");

"map_center" setMarkerAlpha 0;

{
	if(!((typeOf _x) in BADHOUSES)) then
	{
		_p = getPosATL _x;
		_grid = GETGRIDPOS(_p select 0, _p select 1);
		_protected = false;
		{
			_xc = _x select 0;
			_yc = _x select 1;
			if(((_grid select 0) == _xc) && ((_grid select 1) == _yc)) then
			{
				_protected = true;
			};
		} forEach protectedGrids;
		
		if(!_protected) then
		{
			_mkr = str _grid;
			if(getMarkerPos _mkr select 0 == 0) then
			{
				_mkr = createMarkerLocal [_mkr, _grid];
				_mkr setMarkerShapeLocal "RECTANGLE"; 
				_mkr setMarkerTypeLocal "SOLID";		
				_mkr setMarkerSizeLocal [50,50]; 
				_mkr setMarkerAlphaLocal 0.2;
				_mkr setMarkerColorLocal "ColorRed";
			};
		};
	};
} forEach nearestObjects [mapCenter, ["house"], mapRadius];

_i = 0;
while{_i < protectedMkN} do
{
	_name = format ["protect%1", _i];
	_name setMarkerAlpha 0;
	_i = _i + 1;
};