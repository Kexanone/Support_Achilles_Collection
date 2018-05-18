#ifndef DEFAULT_LOCATION
	#define DEFAULT_LOCATION		0
#endif
#ifndef HC_IS_CURATOR
	#define HC_IS_CURATOR			0
#endif

class CarrierLocation
{
	title = "Carrier Location";
	texts[] = {"Negades Bay","Edessa Bay","Pyrgos Gulf","Chalkeia Bay","Kalithea Bay","Galana Nera Bay"};
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