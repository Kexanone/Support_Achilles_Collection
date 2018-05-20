class CfgFunctions
{
	class BIS
	{
		// modifications to BIS functions
		#include "GroundSupport\cfgFunctions.hpp"
		#include "GroundSupportBase\cfgFunctions.hpp"
	};
	class Mission
	{
		class Init
		{
			class preInitServer
			{
				file = "preInitServer.sqf";
				preInit = 1;
			};
		};
		#include "carrier\cfgFunctions.hpp"
		#include "common\cfgFunctions.hpp"
	};
};