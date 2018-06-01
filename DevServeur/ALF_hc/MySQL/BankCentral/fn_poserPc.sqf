#include "\ALF_hc\hc_macros.hpp"

private["_banque","_unit"];
_banque = _this select 0;
_unit = _this select 1;
if (isNull _banque || isNull _unit) exitWith {};

if (_banque animationPhase "pc" isEqualTo 0) exitWith {};
_banque animate ["pc",0];
["ALF_Pc"] remoteExec ["ALF_fnc_p_removeMagazine",_unit];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_start.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_388888.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_308888.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_300888.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_300688.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 50;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_300618.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_bip.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 45;
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_pc_end.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 10, 1, 100];
sleep 5;
_banque setObjectTextureGlobal [0, "ALF_Batiments_2\ALF_Banque\Textures\computer_300614.paa"];
playSound3D ["ALF_Batiments_2\ALF_Banque\banque_bigporte.ogg", _banque, false, (_banque modelToWorld (_banque selectionPosition "p_pc")), 15, 1, 100];
_banque animate ["porte",1];
