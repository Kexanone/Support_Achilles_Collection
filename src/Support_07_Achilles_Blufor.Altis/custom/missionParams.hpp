#ifndef DEFAULT_LOCATION
	#define DEFAULT_LOCATION		0
#endif
#ifndef HC_IS_CURATOR
	#define HC_IS_CURATOR			0
#endif

// Note that effective positions are defined in Mission_fnc_carrier_getPos
class CarrierLocation
{
	title = "Carrier Location";
	texts[] = {"Negades Bay","Edessa Bay","Pyrgos Gulf","Chalkeia Bay","Ammolofi Bay","Kalithea Bay","Galana Nera Bay"};
	values[] = {0,1,2,3,4,5};
	default = DEFAULT_LOCATION;
};

class HcIsCurator
{
	title = "The Commanding Officer has access to Zeus";
	texts[] = {"No","Yes"};
	values[] = {0,1};
	default = HC_IS_CURATOR;
};