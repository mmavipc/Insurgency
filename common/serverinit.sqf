mapCenter = getMarkerPos "map_center";
"map_center" setMarkerAlpha 0;
publicVariable "map_center";
mapRadius = getMarkerSize "map_center" select 0;
publicVariable "mapRadius";

protectedGrids = [];
_i = 0;
while{_i != -1} do
{
	_name = format ["protect%1", _i];
	_p = getMarkerPos _name;
	if((_p select 0) != 0) then
	{
		_size = getMarkerSize _name;
		_name setMarkerAlpha 0;
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
					protectedGrids set [count protectedGrids, [_grid select 0, _grid select 1]];
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
player sideChat str protectedGrids;
publicVariable "protectedGrids";

readyForClients = true;
publicVariable "readyForClients";