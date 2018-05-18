/*--------------------------------------------------------------------------------------------------

	FUNCTION IS MEANT TO RUN ON CLIENT

--------------------------------------------------------------------------------------------------*/
private["_target","_text1","_text2","_pos","_posStart","_posEnd"];

_target = _this select 0;
_text1  = _this select 1;
_text2  = _this select 2;

//create vignette & tiles
("bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];

//show interlacing
("bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];

//static fade-in
("bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];

//apply post-process effects
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppColor = ppEffectCreate ["colorCorrections", 1999];
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppColor ppEffectEnable true;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppColor ppEffectCommit 0;

bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppGrain = ppEffectCreate ["filmGrain", 2012];
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppGrain ppEffectEnable true;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam_ppGrain ppEffectCommit 0;

_pos	  = [getPosATL _target, getPosASL _target] select (surfaceIsWater getPos _target);
_posStart = [_pos,[5,5,5]] call BIS_fnc_vectorAdd;
_posEnd   = [_pos,[5,5,15]] call BIS_fnc_vectorAdd;

bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam = "Camera" camCreate _posStart;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam cameraEffect ["INTERNAL", "BACK"];

showCinemaBorder false;

bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camPreparePos _posStart;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camPrepareTarget _target;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camPrepareFOV 0.700;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camCommitPrepared 0;

bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camPreparePos _posEnd;
bis_fnc_moduleMPTypeGroundSupportBase_spectatorCam camCommitPrepared 5;

BIS_fnc_feedback_allowPP = false;

//type the OSD text
[[[_text1,"align = 'left'"],["","<br/>"],[_text2,"align = 'left' size = '0.7'"]],safezoneX + 0.02,safezoneY + 0.02,false,"<t align = 'left' size='1.0' font='PuristaLight'>%1</t>",[player],{isNull(_this select 0) || {!canMove(_this select 0)} || {!alive((_this select 0))}}] spawn BIS_fnc_typeText2;