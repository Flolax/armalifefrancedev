/*
	File: fn_fadeSound.sqf
	Auhtor: ALF Team

	Description:
	Casque Anti-Bruit
*/
if((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};
life_action_delay = time;

life_fadeSound = !life_fadeSound;

if (life_fadeSound) then
{
	1 fadeSound 0.1; // R�duit � 10%
}
else
{
	1 fadeSound 1; // Retourn� a la normal (100%)
};
