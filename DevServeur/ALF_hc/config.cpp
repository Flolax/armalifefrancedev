#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
	class life_headless_client
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F"};
		fileName = "ALF_hc.pbo";
		author[] = {"Nanou"};
	};
};

class CfgFunctions
{
	class Headless_Client
	{
		tag = "HC";
		class General
		{
			file = "\ALF_hc\MySQL\General";
			class asyncCall {};
			class bool {};
			class insertRequest {};
			class insertVehicle {};
			class mresArray {};
			class mresString {};
			class mresToArray {};
			class numberSafe {};
			class queryRequest {};
			class updatePartial {};
			class updateRequest {};
			class cleanup {};
			class huntingZone {};
			class receivekeyofServer {};
			class FirstJoinServer {};
		};

		class Bank
		{
			file = "\ALF_hc\MySQL\Bank";
			class cbParametre {};
			class achatCompteBancaire {};
			class transferExtCompteBancaire {};
		};

		class BankCentral
		{
			file = "\ALF_hc\MySQL\BankCentral";
			class poserC4 {};
			class poserPc {};
		};

		class Hsbc
		{
			file = "\ALF_hc\MySQL\Hsbc";
			class achatHsbc {};
			class transferHsbc {};
		};

		class Housing
		{
			file = "\ALF_hc\MySQL\Housing";
			class addMobilier {};
			class addHouse {};
			class deleteDBMobilier {};
			class fetchPlayerHouses {};
			class houseCleanup {};
			class sellHouse {};
			class sellHouseMobilier {};
			class updateHouseMobiliers {};
			class initHouses {};
		};

		class Gangs
		{
			file = "\ALF_hc\MySQL\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};

		class Phone
		{
			file = "\ALF_hc\MySQL\Phone";
			class buyForfait {};
			class countDownForfait {};
			class removeForfait {};
			class createPhoneNumber {};
			class updateContactsPhone {};
			class sendSmsPhone {};
		};

		class Nokia
		{
			file = "\ALF_hc\MySQL\Phone\Nokia";
			class loadSmsNokia {};
			class deleteSmsNokia {};
		};

		class iPhone
		{
			file = "\ALF_hc\MySQL\Phone\iPhone";
			class loadSmsiPhone {};
			class deleteSmsiPhone {};
		};

		class SonyCop
		{
			file = "\ALF_hc\MySQL\Phone\Sony";
			class loadSmsSony {};
			class deleteSmsSony {};
		};

		class Bourse
		{
			file = "\ALF_hc\MySQL\Bourse";
			class calculBourse {};
			class initBourse {};
			class saveBourse {};
			class updateBourse {};
			class loggedBourse {};
		};

		class Vehicles
		{
			file = "\ALF_hc\MySQL\Vehicles";
			class chopShopSell {};
			class getVehicles {};
			class spawnVehicle {};
			class vehicleStore {};
			class vehicleCreate {};
			class vehicleDelete {};
			class vehicleUpdate {};
			class vehicleAutoSync {};
			class spawnVehicleLaunch {};
			class insureVehicles {};
			class recherchePlaque {};
			class dispoVehicle {};
			class buyVehicle {};
		};

		class Wanted_Sys
		{
			file = "\ALF_hc\MySQL\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedCrimes {};
			class wantedProfUpdate {};
		};

		class Farming
		{
			file = "\ALF_hc\MySQL\Farming";
			class appleSystem;
			class fonderieSystem;
		};

		class Jail
		{
			file = "\ALF_hc\MySQL\Jail";
			class jailSys;
		};

		class Items
		{
			file = "\ALF_hc\MySQL\Items";
			class spikeStrip {};
		};

		class Station
		{
			file = "\ALF_hc\MySQL\Station";
			class addStation {};
			class fetchPlayerStations {};
			class initStation {};
			class sellStation {};
		};

	};

};
