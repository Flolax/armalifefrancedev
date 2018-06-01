//	@file Version: 1.0
//	@file Name: fpsfix.sqf
//	@file Author: AgentRev
//  @file WebSite: www.altisliferpg.com.br
//	@file Created: 01/03/2015 07:50

// Ce script va augmenter FPS client de 25-50% pour les missions avec beaucoup de véhicules répartis dans la carte.
// Il doit être engendré ou execVM'd une fois sur chaque client. Pour A3Wasteland, il est execVM'd à la fin de "client \ init.sqf"

if (isServer) exitWith {};

[] spawn {

	private ["_eventCode", "_vehicleManager"];

	_eventCode =
	{
		_vehicle = _this select 0;
		if (!simulationEnabled _vehicle) then { _vehicle enableSimulation true };
		_vehicle setVariable ["fpsFix_simulationCooloff", diag_tickTime + 20];
	};

	_vehicleManager =
	{
		private ["_vehicle", "_tryEnable", "_dist", "_vel"];

		{
			if !(_x isKindOf "CAManBase") then
			{
				_vehicle = _x;
				_tryEnable = true;

				if (!local _vehicle &&
				   {_vehicle isKindOf "Man" || {count crew _vehicle isEqualTo 0}} &&
				   {_vehicle getVariable ["fpsFix_simulationCooloff", 0] < diag_tickTime} &&
				   {isTouchingGround _vehicle}) then
				{
					_dist = _vehicle distance positionCameraToWorld [0,0,0];
					_vel = velocity _vehicle distance [0,0,0];

					if ((_vel < 0.1 && {!(_vehicle isKindOf "Man")} && {_dist > 1000}) ||
					   {_dist > 2000}) then
					{
						_vehicle enableSimulation false;
						_tryEnable = false;
						sleep 0.01;
					};
				};

				if (_tryEnable && {!simulationEnabled _vehicle}) then
				{
					_vehicle enableSimulation true;
				};

				if !(_vehicle getVariable ["fpsFix_eventHandlers", false]) then
				{
					if (_vehicle isKindOf "AllVehicles" && {!(_vehicle isKindOf "Man")}) then
					{
						_vehicle addEventHandler ["GetIn", _eventCode];
					};

					_vehicle addEventHandler ["Killed", _eventCode];

					_vehicle setVariable ["fpsFix_eventHandlers", true];
				};
			};
		} forEach entities "All";
	};

	_lastPos = [0,0,0];

	for "_i" from 0 to 1 step 0 do {
		_camPos = positionCameraToWorld [0,0,0];
		if (_lastPos distance _camPos > 100) then
		{
			_lastPos = _camPos;
			call _vehicleManager;
		};
		sleep 5;
	};

};
