#include "\ALF_hc\hc_macros.hpp"
/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
private["_currentArray"];

ALFMARKET_PriceUpdateTime = 5;
ALFMARKET_SaveToBDD = true;
ALFMARKET_SaveToBDDTime = 3;

ALFMARKET_Items_Groups =
[
	["Legal",
		[
			["ALF_pierre_or_small",-1,10,1000]
		],
		0.8
	],
	["Illegal",
		[

		],
		0.5
	]
];

ALFMARKET_Items_Base =
[
	["ALF_pierre_or_small",500]
];

ALFMARKET_Items_PriceArr = [];
ALFMARKET_sellarraycopy = ALFMARKET_Items_Base;
{
	_currentArray = _x;
	ALFMARKET_Items_PriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach ALFMARKET_Items_Base;

if (ALFMARKET_SaveToBDD) then {[1] call HC_fnc_saveBourse;};
ALFMARKET_UpdateCount = 0;

sleep 5;

while {true} do {
	sleep (ALFMARKET_PriceUpdateTime*60);
	[0] remoteExecCall ["ALF_fnc_updateClientBourse",RANY];
	sleep 5;
	[] spawn HC_fnc_calculBourse;
	ALFMARKET_UpdateCount = ALFMARKET_UpdateCount + 1;
	if ((ALFMARKET_UpdateCount isEqualTo ALFMARKET_SaveToBDDTime) && ALFMARKET_SaveToBDD) then {
		[] spawn {
			ALFMARKET_UpdateCount = 0;
			[0] call HC_fnc_saveBourse;
		};
	};
};
