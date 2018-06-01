#include "\ALF_hc\hc_macros.hpp"
/*
	This file is for Nanou's HeadlessClient.
*/
private ["_item","_obj","_obj2","_obj3","_obj4","_obj5","_obj6","_obj7","_obj8","_obj9","_obj10","_obj11","_obj12"];
_item = "ALF_Pomme";
_obj = createVehicle ["groundweaponholder", [8140.51,9494.81,0.00144494], [], 0, "CAN_COLLIDE"];
_obj2 = createVehicle ["groundweaponholder", [8138.1,9493.52,0.00140405], [], 0, "CAN_COLLIDE"];
_obj3 = createVehicle ["groundweaponholder", [8124.59,9493.55,0.0014658], [], 0, "CAN_COLLIDE"];
_obj4 = createVehicle ["groundweaponholder", [8120.38,9493.66,0.00141561], [], 0, "CAN_COLLIDE"];
_obj5 = createVehicle ["groundweaponholder", [8105.79,9491.28,0.00146806], [], 0, "CAN_COLLIDE"];
_obj6 = createVehicle ["groundweaponholder", [8102.97,9491.08,0.00140476], [], 0, "CAN_COLLIDE"];
_obj7 = createVehicle ["groundweaponholder", [8129.52,9504.72,0.0014168], [], 0, "CAN_COLLIDE"];
_obj8 = createVehicle ["groundweaponholder", [8149.2,9517.3,0.00145733], [], 0, "CAN_COLLIDE"];
_obj9 = createVehicle ["groundweaponholder", [8164.21,9509.01,0.00146317], [], 0, "CAN_COLLIDE"];
_obj10 = createVehicle ["groundweaponholder", [8127.27,9487.1,0.00145483], [], 0, "CAN_COLLIDE"];
_obj11 = createVehicle ["groundweaponholder", [8119.42,9482.58,0.00141239], [], 0, "CAN_COLLIDE"];
_obj12 = createVehicle ["groundweaponholder", [8104.52,9478.91,0.00141859], [], 0, "CAN_COLLIDE"];

for "_i" from 0 to 1 step 0 do {
	if(isNull _obj OR isNil "_obj") then {_obj = createVehicle ["groundweaponholder", [8140.51,9494.81,0.00144494], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj2 OR isNil "_obj2") then {_obj2 = createVehicle ["groundweaponholder", [8138.1,9493.52,0.00140405], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj3 OR isNil "_obj3") then {_obj3 = createVehicle ["groundweaponholder", [8124.59,9493.55,0.0014658], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj4 OR isNil "_obj4") then {_obj4 = createVehicle ["groundweaponholder", [8120.38,9493.66,0.00141561], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj5 OR isNil "_obj5") then {_obj5 = createVehicle ["groundweaponholder", [8105.79,9491.28,0.00146806], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj6 OR isNil "_obj6") then {_obj6 = createVehicle ["groundweaponholder", [8102.97,9491.08,0.00140476], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj7 OR isNil "_obj7") then {_obj7 = createVehicle ["groundweaponholder", [8129.52,9504.72,0.0014168], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj8 OR isNil "_obj8") then {_obj8 = createVehicle ["groundweaponholder", [8149.2,9517.3,0.00145733], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj9 OR isNil "_obj9") then {_obj9 = createVehicle ["groundweaponholder", [8164.21,9509.01,0.00146317], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj10 OR isNil "_obj10") then {_obj10 = createVehicle ["groundweaponholder", [8127.27,9487.1,0.00145483], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj11 OR isNil "_obj11") then {_obj11 = createVehicle ["groundweaponholder", [8119.42,9482.58,0.00141239], [], 0, "CAN_COLLIDE"];};
	if(isNull _obj12 OR isNil "_obj12") then {_obj12 = createVehicle ["groundweaponholder", [8104.52,9478.91,0.00141859], [], 0, "CAN_COLLIDE"];};
	{
		if(count (magazineCargo _x) < 10) then {
			_x addMagazineCargoGlobal [_item,2];
		};
	} forEach [_obj,_obj2,_obj3,_obj4,_obj5,_obj6,_obj7,_obj8,_obj9,_obj10,_obj11,_obj12];
  sleep 60;
};

