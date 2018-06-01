ALF_fnc_FeuA = {

	if (isServer) then {
		private ["_trafficlight"];

		_trafficlight = _this select 0;
		if (!(typeOf _trafficlight IN ["Land_ALF_trico_1"])) exitwith {};

		sleep 3;

		for "_i" from 0 to 1 step 0 do {
			_trafficlight animate ["feu_vert",1];
			_trafficlight animate ["feu_rouge",0];
			sleep 15;
			_trafficlight animate ["feu_orange",1];
			_trafficlight animate ["feu_vert",0];
			sleep 3;
			_trafficlight animate ["feu_rouge",1];
			_trafficlight animate ["feu_orange",0];
			sleep 20;
		};
	};
};

ALF_fnc_FeuB = {

	if (isServer) then {
		private ["_trafficlight"];

		_trafficlight = _this select 0;
		if (!(typeOf _trafficlight IN ["Land_ALF_trico_2"])) exitwith {};

		sleep 3;

		for "_i" from 0 to 1 step 0 do {
			_trafficlight animate ["feu_rouge",1];
			_trafficlight animate ["feu_orange",0];
			sleep 20;
			_trafficlight animate ["feu_vert",1];
			_trafficlight animate ["feu_rouge",0];
			sleep 15;
			_trafficlight animate ["feu_orange",1];
			_trafficlight animate ["feu_vert",0];
			sleep 3;
		};
	};
};

private ["_position","_objectsA","_objectsB"];

_position = [6434.03,7579.4,0];
_objectsA = nearestObjects [_position, ["Land_ALF_trico_1"], 10000];
_objectsB = nearestObjects [_position, ["Land_ALF_trico_2"], 10000];


{
	[_x] spawn ALF_fnc_FeuA;
} foreach _objectsA;

{
	[_x] spawn ALF_fnc_FeuB;
} foreach _objectsB;