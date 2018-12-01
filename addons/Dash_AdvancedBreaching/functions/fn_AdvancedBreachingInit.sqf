params["_player"];
hint "hey";
//1Rnd_Zipline_shell
/*
_player setVariable ["AdvancedBreachingShotgunHasEH", false, true];
_player setVariable ["AdvancedBreachingMagazines", ["CUP_20Rnd_B_AA12_74Breaching", "CUP_8Rnd_B_Saiga12_74Breaching_M", "CUP_8Rnd_B_Beneli_74Breaching"], true];

_player addEventHandler["Reloaded", {
  params["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];

  if ((!(_unit getVariable "AdvancedBreachingShotgunHasEH")) && ((_unit getVariable "AdvancedBreachingMagazines") find (_newMagazine select 0))) then {
    _unit setVariable ["AdvancedBreachingShotgunHasEH", true, true];

      _AdvancedBreachingShotgunFiredManEH = _unit addEventHandler["FiredMan", {
        _this spawn {
          params["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

          if ((_unit getVariable "AdvancedBreachingMagazines") find _magazine) exitWith {};

          _unit setAmmo [currentWeapon _unit, 0];

          _building = cursorObject;
          _numberOfDoors = getNumber (configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
          if (_numberOfDoors <= 0) exitWith {};

          _arrayOfDoorIndicators = [];

          _arrayOfDistances = [];
          
          for "_i" from 1 to _numberOfDoors do {
            _doorIndicator = "VR_3DSelector_01_default_F" createVehicle (getPosASL _building);
            _doorIndicator attachTo [_building, [0, 0, 0], format ["Door_%1_trigger", _i]]; 
            _arrayOfDistances = _arrayOfDistances + [_unit distance _doorIndicator];
            _arrayOfDoorIndicators = _arrayOfDoorIndicators + [_doorIndicator];
            hideObjectGlobal _doorIndicator;
          };

          _minIndex = -1;
          _minValue = -1;

          for "_i" from 0 to _numberOfDoors - 1 do {
            if (_minIndex == -1)  then {
              _minIndex = _i;
              _minValue = _arrayOfDistances select _i;
            } else {
              _value = _arrayOfDistances select _i;

              if (_value < _minValue) then {
                _minValue = _value;
                _minIndex = _i;
              };
            };
          };

          if (_unit distance (_arrayOfDoorIndicators select _minIndex) > 2.5) exitWith {};

          _building animate [format ["Door_%1_rot", _minIndex + 1], 1];
          _building setVariable [format ["bis_disabled_Door_%1", _minIndex + 1], 0, true];
        };
      }];
  } else {
    if ((_unit getVariable "AdvancedBreachingShotgunHasEH") && ((_unit getVariable "AdvancedBreachingMagazines") find (_newMagazine select 0))) then {
      _unit setVariable ["AdvancedBreachingShotgunHasEH", false, true];
      _unit removeEventHandler["FiredMan", _AdvancedBreachingShotgunFiredManEH];
    };
  };
}];

_player setVariable ["AdvancedBreachingChargeHasPlacingAction", false, true];

_player addEventHandler ["InventoryClosed", {
  params ["_unit", "_container"];

  if ((magazines _unit find "DemoCharge_Remote_Mag" != -1) && (!(_player getVariable "AdvancedBreachingChargeHasPlacingAction"))) then {
    _unit setVariable ["AdvancedBreachingChargeHasPlacingAction", true, true];

    _unit addAction ["Place breaching charge", {
      params ["_target", "_caller", "_actionId", "_arguments"];

      _building = cursorObject;
      _numberOfDoors = getNumber (configFile >> "CfgVehicles" >> (typeOf _building) >> "numberOfDoors");
      if (_numberOfDoors <= 0) exitWith {hint "Invalid position.";};

      _arrayOfDoorIndicators = [];

      _arrayOfDistances = [];
        
      for "_i" from 1 to _numberOfDoors do {
        _doorIndicator = "SatchelCharge_F" createVehicle (getPosASL _building);
        _doorIndicator attachTo [_building, [0, 0, 0], format ["Door_%1_trigger", _i]]; 
        _arrayOfDistances = _arrayOfDistances + [_target distance _doorIndicator];
        _arrayOfDoorIndicators = _arrayOfDoorIndicators + [_doorIndicator];
        hideObjectGlobal _doorIndicator;
      };

      _minIndex = -1;
      _minValue = -1;

      for "_i" from 0 to _numberOfDoors - 1 do {
        if (_minIndex == -1)  then {
          _minIndex = _i;
          _minValue = _arrayOfDistances select _i;
        } else {
          _value = _arrayOfDistances select _i;

          if (_value < _minValue) then {
            _minValue = _value;
            _minIndex = _i;
          };
        };
      };

      if (_target distance (_arrayOfDoorIndicators select _minIndex) > 2.5) exitWith {hint "Too far from the door.";};

      _target removeItem "DemoCharge_Remote_Mag";
      
      if (magazines _target find "DemoCharge_Remote_Mag" == -1) then {
        _target removeAction _actionId;
        _target setVariable ["AdvancedBreachingChargeHasPlacingAction", false, true];
      };

      _charge = _arrayOfDoorIndicators select _minIndex;
      _charge hideObjectGlobal false;

      _target addAction ["Detonate breaching charge", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _player = _arguments select 0;
        _charge = _arguments select 1;
        _building = _arguments select 2;
        _minIndex = _arguments select 3;

        _player removeAction _actionId;
        hideObjectGlobal _charge;
        _building animate [format ["Door_%1_rot", _minIndex + 1], 1];
        _building setVariable [format ["bis_disabled_Door_%1", _minIndex + 1], 0, true];
        _explosion = "APERSTripMine_Wire_Ammo" createVehicle getPosASL _charge;  
        _explosion setDamage 1;
      },[_target, _charge, _building, _minIndex]];
    }];
  };
}];
*/