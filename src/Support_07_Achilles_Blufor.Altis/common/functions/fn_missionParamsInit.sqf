// {"Negades Bay","Edessa Bay","Pyrgos Gulf","Chalkeia Bay","Ammolofi Bay","Kalithea Bay","Galana Nera Bay"}
#define CARRIER_POSITIONS [[3000,16000,0], [7000,10000,0], [15000.1,14000,0], [22500,12500,0], [10533.7,23665.9,0], [19000,20000,0], [25500,24500,0]]
#define MEDIC_POSITIONS [[3194.4,17670.8,0], [7584.62,10273.4,0], [13931.1,15159.1,0], [21330.8,12457.8,0], [8585.38,23650.5,0], [19398.8,19369.6,0], [23988.4,24523.9,0.297683]]

private _startLocationIdx = ["CarrierLocation", 0] call BIS_fnc_getParamValue;
Mission_var_carrierPosition = CARRIER_POSITIONS select _startLocationIdx;
Mission_var_medicPosition = MEDIC_POSITIONS select _startLocationIdx;
