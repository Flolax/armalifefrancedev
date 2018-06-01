/*
	fn_doGps.sqf
	ALF Team & Critical Gaming

	["Titre", "Distance" ,"Message"] call doGps;
*/

disableSerialization;
private["_image","_distance","_texte","_png","_POPUPCLASS1","_POPUP","_blah","_pos"];
params ["_image", "_distance","_texte"];

_png = "";
switch (_image) do {
	case "D" : {_png = "\ALF_Client\textures\AutoEcole\d.paa"};
	case "DT" : {_png = "\ALF_Client\textures\AutoEcole\dt.paa"};
	case "G" : {_png = "\ALF_Client\textures\AutoEcole\g.paa"};
	case "RP" : {_png = "\ALF_Client\textures\AutoEcole\rp.paa"};
	case "TD" : {_png = "\ALF_Client\textures\AutoEcole\td.paa"};
};

1 cutRsc ["RSC_DOGPS","PLAIN"];
_POPUPCLASS1 = uiNameSpace getVariable ["RSC_DOGPS",displayNull];
_POPUP = _POPUPCLASS1 displayCtrl 13450;
_POPUP ctrlSetStructuredText parseText format["<img align='center' size='7' image='%1'/><br/><t align='center' size='4'>%2</t><br/><t align='center' size='1.2'>%3</t>",_png ,_distance ,_texte];
