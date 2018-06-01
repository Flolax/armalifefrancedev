#include "\ALF_Client\script_macros.hpp"
/*
File: fn_showCarStats.sqf
Author: ALF Team
Description:

*/
private["_veh"];
_veh = _this select 0;
disableSerialization;
_display = findDisplay 30200;
_EngineCarVert = _display displayCtrl 30201;
_EngineCarOrange = _display displayCtrl 30202;
_EngineCarRouge = _display displayCtrl 30203;
_LFCarVert = _display displayCtrl 30204;
_LFCarOrange = _display displayCtrl 30205;
_LFCarRouge = _display displayCtrl 30206;
_LF2CarVert = _display displayCtrl 30207;
_LF2CarOrange = _display displayCtrl 30208;
_LF2CarRouge = _display displayCtrl 30209;
_LRCarVert = _display displayCtrl 30210;
_LRCarOrange = _display displayCtrl 30211;
_LRCarRouge = _display displayCtrl 30212;
_LR2CarVert = _display displayCtrl 30213;
_LR2CarOrange = _display displayCtrl 30214;
_LR2CarRouge = _display displayCtrl 30215;
_MainCarVert = _display displayCtrl 30216;
_MainCarOrange = _display displayCtrl 30217;
_MainCarRouge = _display displayCtrl 30218;
_Fuel0 = _display displayCtrl 30300;
_Fuel10 = _display displayCtrl 30301;
_Fuel20 = _display displayCtrl 30302;
_Fuel30 = _display displayCtrl 30303;
_Fuel40 = _display displayCtrl 30304;
_Fuel50 = _display displayCtrl 30305;
_Fuel60 = _display displayCtrl 30306;
_Fuel70 = _display displayCtrl 30307;
_Fuel80 = _display displayCtrl 30308;
_Fuel90 = _display displayCtrl 30309;
_Fuel100 = _display displayCtrl 30310;

_dammage = getDammage _veh;
switch (true) do {
	case (_dammage < 0.33) : {
		_MainCarVert ctrlShow true;
		_MainCarOrange ctrlShow false;
		_MainCarRouge ctrlShow false;
	};
	case (_dammage > 0.33 && _dammage < 0.66) : {
		_MainCarVert ctrlShow false;
		_MainCarOrange ctrlShow true;
		_MainCarRouge ctrlShow false;
	};
	case (_dammage > 0.66) : {
		_MainCarVert ctrlShow false;
		_MainCarOrange ctrlShow false;
		_MainCarRouge ctrlShow true;
	};
};

_engineDamage = _veh getHitPointDamage "hitEngine";
switch (true) do {
	case (_engineDamage < 0.33) : {
		_EngineCarVert ctrlShow true;
		_EngineCarOrange ctrlShow false;
		_EngineCarRouge ctrlShow false;
	};
	case (_engineDamage > 0.33 && _engineDamage < 0.66) : {
		_EngineCarVert ctrlShow false;
		_EngineCarOrange ctrlShow true;
		_EngineCarRouge ctrlShow false;
	};
	case (_engineDamage > 0.66) : {
		_EngineCarVert ctrlShow false;
		_EngineCarOrange ctrlShow false;
		_EngineCarRouge ctrlShow true;
	};
};

_hitlf = _veh getHitPointDamage "HitLFWheel";
switch (true) do {
	case (_hitlf < 0.33) : {
		_LFCarVert ctrlShow true;
		_LFCarOrange ctrlShow false;
		_LFCarRouge ctrlShow false;
	};
	case (_hitlf > 0.33 && _hitlf < 0.66) : {
		_LFCarVert ctrlShow false;
		_LFCarOrange ctrlShow true;
		_LFCarRouge ctrlShow false;
	};
	case (_hitlf > 0.66) : {
		_LFCarVert ctrlShow false;
		_LFCarOrange ctrlShow false;
		_LFCarRouge ctrlShow true;
	};
};
_hitlf2 = _veh getHitPointDamage "HitLF2Wheel";
switch (true) do {
	case (_hitlf2 < 0.33) : {
		_LF2CarVert ctrlShow true;
		_LF2CarOrange ctrlShow false;
		_LF2CarRouge ctrlShow false;
	};
	case (_hitlf2 > 0.33 && _hitlf2 < 0.66) : {
		_LF2CarVert ctrlShow false;
		_LF2CarOrange ctrlShow true;
		_LF2CarRouge ctrlShow false;
	};
	case (_hitlf2 > 0.66) : {
		_LF2CarVert ctrlShow false;
		_LF2CarOrange ctrlShow false;
		_LF2CarRouge ctrlShow true;
	};
};
_hitrf = _veh getHitPointDamage "HitRFWheel";
switch (true) do {
	case (_hitrf < 0.33) : {
		_LRCarVert ctrlShow true;
		_LRCarOrange ctrlShow false;
		_LRCarRouge ctrlShow false;
	};
	case (_hitrf > 0.33 && _hitrf < 0.66) : {
		_LRCarVert ctrlShow false;
		_LRCarOrange ctrlShow true;
		_LRCarRouge ctrlShow false;
	};
	case (_hitrf > 0.66) : {
		_LRCarVert ctrlShow false;
		_LRCarOrange ctrlShow false;
		_LRCarRouge ctrlShow true;
	};
};
_hitrf2 = _veh getHitPointDamage "HitRF2Wheel";
switch (true) do {
	case (_hitrf2 < 0.33) : {
		_LR2CarVert ctrlShow true;
		_LR2CarOrange ctrlShow false;
		_LR2CarRouge ctrlShow false;
	};
	case (_hitrf2 > 0.33 && _hitrf2 < 0.66) : {
		_LR2CarVert ctrlShow false;
		_LR2CarOrange ctrlShow true;
		_LR2CarRouge ctrlShow false;
	};
	case (_hitrf2 > 0.66) : {
		_LR2CarVert ctrlShow false;
		_LR2CarOrange ctrlShow false;
		_LR2CarRouge ctrlShow true;
	};
};

if (_veh in life_vehicles) then {
	_fuel = fuel _veh;
	switch (true) do {
		case (_fuel isEqualTo 0) : {
			_Fuel0 ctrlShow true;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0 && _fuel < 0.1) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow true;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.1 && _fuel < 0.2) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow true;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.2 && _fuel < 0.3) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow true;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.3 && _fuel < 0.4) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow true;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.4 && _fuel < 0.5) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow true;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.5 && _fuel < 0.6) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow true;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.6 && _fuel < 0.7) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow true;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.7 && _fuel < 0.8) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow true;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.8 && _fuel < 0.9) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow true;
			_Fuel100 ctrlShow false;
		};
		case (_fuel > 0.9) : {
			_Fuel0 ctrlShow false;
			_Fuel10 ctrlShow false;
			_Fuel20 ctrlShow false;
			_Fuel30 ctrlShow false;
			_Fuel40 ctrlShow false;
			_Fuel50 ctrlShow false;
			_Fuel60 ctrlShow false;
			_Fuel70 ctrlShow false;
			_Fuel80 ctrlShow false;
			_Fuel90 ctrlShow false;
			_Fuel100 ctrlShow true;
		};
	};
} else {
	_Fuel0 ctrlShow false;
	_Fuel10 ctrlShow false;
	_Fuel20 ctrlShow false;
	_Fuel30 ctrlShow false;
	_Fuel40 ctrlShow false;
	_Fuel50 ctrlShow false;
	_Fuel60 ctrlShow false;
	_Fuel70 ctrlShow false;
	_Fuel80 ctrlShow false;
	_Fuel90 ctrlShow false;
	_Fuel100 ctrlShow false;
};
