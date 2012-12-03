mapCenter = getMarkerPos "map_center";
publicVariable "map_center";
mapRadius = getMarkerSize "map_center" select 0;
publicVariable "mapRadius";

protectedGrids = [];
protectedMkN = 0;
_i = 0;
while{_i != -1} do
{
	_name = format ["protect%1", _i];
	_p = getMarkerPos _name;
	if((_p select 0) != 0) then
	{
		protectedMkN = protectedMkN + 1;
		_size = getMarkerSize _name;
		_size = _size select 0;
		_size = _size / 50;
		_p set [0, (_p select 0) - (50 * _size)];
		_p set [1, (_p select 1) - (25 * _size)];
		_grid = GETGRIDPOS(_p select 0, _p select 1);
		_x = 0;
		while{_x < _size} do
		{
			_y = 0;
			while{_y < _size} do
			{
				if(!(_grid in protectedGrids)) then
				{
					protectedGrids set [count protectedGrids, str _grid]; //We make it a string so the "in" command will work properly
				};
				_grid set [1, (_grid select 1) + 100];
				_y = _y + 1;
			};
			_grid set [1, (_grid select 1) - (100 * _size)];
			_grid set [0, (_grid select 0) + 100];
			_x = _x + 1;
		};
		_i = _i + 1;
	}
	else
	{
		_i = -1;
	};
};
publicVariable "protectedGrids";
publicVariable "protectedMkN";

coloredGrids = [];
{
	if(!((typeOf _x) in BADHOUSES)) then
	{
		_p = getPosATL _x;
		_grid = GETGRIDPOS(_p select 0, _p select 1);
		_protected = (str _grid) in protectedGrids;
		
		if(!_protected) then
		{
			if(!((str _grid) in coloredGrids)) then
			{
				coloredGrids set [count coloredGrids, str _grid];
			};
		};
	};
} forEach nearestObjects [mapCenter, ["house"], mapRadius];
{
	coloredGrids set[_forEachIndex, call compile _x];
} forEach coloredGrids;
publicVariable "coloredGrids";

insurgentGrids = [];

readyForClients = true;
publicVariable "readyForClients";