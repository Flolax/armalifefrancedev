class Socket_Reciever {
	tag = "SOCK";
	class SQL_Socket {
		file = "\ALF_Client\core\session";
		class dataQuery {};
		class insertPlayerInfo {};
		class syncData {};
		class updatePartial {};
		class updateRequest {};
		class requestReceived {};
	};
};

class ALF_System {
	tag = "ALF";

	class Master_Directory {
		file = "\ALF_Client\ALF_System";
		class initTFR {};
		class initPlayer {};
		class setupActions {};
		class setupEVH {};
		class survival {};
		class welcomeNotification {};
	};

	class Bank {
		file = "\ALF_Client\ALF_System\Bank";
		class menuCompteBancaire {};
		class achatCompteBancaire {};
		class accessCompteBancaire {};
		class deposerCompteBancaire {};
		class retirerCompteBancaire {};
		class transferCompteBancaire {};
		class transferExtCompteBancaire {};
		class afterTransferCompteBancaire {};
		class badTransferCompteBancaire {};
		class infoTransferCompteBancaire {};
		class updateCompteBancaire {};
		class cbParametre {};
	};

	class Interaction {
		file = "\ALF_Client\ALF_System\Interaction";
		class menuGendarme {};
	};

	class Gendarmerie {
		file = "\ALF_Client\ALF_System\Gendarmerie";
		class menuPlaque {};
		class recherchePlaque {};
		class resultPlaque {};
	};

	class Hsbc {
		file = "\ALF_Client\ALF_System\Hsbc";
		class menuHsbc {};
		class achatHsbc {};
		class accessHsbc {};
		class deposerHsbc {};
		class retirerHsbc {};
		class transferExtHsbc {};
		class afterTransferHsbc {};
		class badTransferHsbc {};
		class infoTransferHsbc {};
		class updateHsbc {};
		class conversionHsbc {};
	};

	class Dab {
		file = "\ALF_Client\ALF_System\Dab";
		class menuDab {};
		class accessDab {};
		class retirerDab {};
		class transferDab {};
		class updateDab {};
	};

	class Hud {
		file = "\ALF_Client\ALF_System\Hud";
		class doCallIn {};
		class doMsg {};
		class doSms {};
		class doGps {};
		class doCopCall {};
		class doQuickMsg {};
		class hudSetup {};
		class hudUpdate {};
	};
	class YMenu {
		file = "\ALF_Client\ALF_System\Hud\Y";
		class menuY {};
		class receiveMoney {};
		class giveMoney {};
		class keyGive {};
		class keyDrop {};
		class s_onChar {};
		class s_onCheckedChange {};
		class s_onSliderChange {};
		class settingsMenu {};
		class updateViewDistance {};
	};

	class Player {
		file = "\ALF_Client\ALF_System\Player";
		class useItemAction {};
		class fadeSound {};
		class permisCar {};
		class handleCB {};
		class buyMobilier {};
		class p_removeMagazine {};
		class switchMove {};
	};

	class Farming {
		file = "\ALF_Client\ALF_System\Farming";
		class taillageSystem {};
		class minageSystem {};
	};

	class Phone {
		file = "\ALF_Client\ALF_System\Phone";
		class menuForfait {};
		class updateForfait {};
		class buyForfait {};
		class receptionSmsPhone {};
	};

	class Calling {
		file = "\ALF_Client\ALF_System\Phone\Call";
		class callContactNokia {};
		class callCustomNokia {};
		class iamBusy {};
		class resetCall {};
		class ringPlayer {};
		class ringNullPlayer {};
		class callingSystem {};
		class answerCall {};
		class callInProgress {};
		class callTime {};
		class callForceEnd {};
		class callSetVolume {};
		class callDisablePhone {};
		class callSetSpeaker {};
		class callCop {};
		class callInCopCentral {};
	};

	class Nokia {
		file = "\ALF_Client\ALF_System\Phone\Nokia";
		class menuNokia {};
		class addContactNokia {};
		class deleteContactNokia {};
		class smsContactNokia {};
		class sendSmsNokia {};
		class sendNewSmsNokia {};
		class replySmsNokia {};
		class deleteSmsNokia {};
		class updateSmsNokia {};
		class lbChangedSmsNokia {};
		class setViberNokia {};
		class smsNokia {};
		class callRecentNokia {};
		class smsRecentNokia {};
	};

	class iPhone {
		file = "\ALF_Client\ALF_System\Phone\iPhone";
		class menuiPhone {};
		class iPhoneCallCustom {};
		class iPhoneCallContact {};
		class iPhoneSmsContact {};
		class iPhoneSmsContactSend {};
		class iPhoneNewSmsSend {};
		class iPhoneaddContact {};
		class iPhonedeleteContact {};
		class iPhoneMute {};
		class iPhoneUnmute {};
		class iPhoneRing {};
		class iPhoneSetVolume {};
		class iPhoneSpeakers {};
		class setiPhoneBackGround {};
		class setiPhoneDate {};
		class setiPhoneAnonyme {};
		class setiPhoneBackGround2 {};
		class setiPhoneRing {};
		class setiPhoneViber {};
		class iPhoneRadioConnect {};
		class iPhoneRadioDisconnect {};
		class updateSmsiPhone {};
		class lbChangedSmsiPhone {};
		class deleteSmsiPhone {};
		class iPhoneReplySms {};
		class iPhoneSmsSend {};
		class iPhoneCallRecent {};
		class iPhoneSmsRecent {};
	};
	class Sony {
		file = "\ALF_Client\ALF_System\Phone\Sony";
		class menuSony {};
		class setSonyDate {};
		class setupRadioSony {};
		class connectRadioSony {};
		class sonyRadioDisconnect {};
		class SonySetVolume {};
		class SonyRadioSetVolume {};
		class SonyCallCustom {};
		class SonyCallContact {};
		class SonyCallRecent {};
		class SonyUnmute {};
		class SonyMute {};
		class SonySpeakers {};
		class terminateCallCentral {};
		class joinCallCentral {};
		class SonyDeleteContact {};
		class SonyAddContact {};
		class SonySetStereo {};
		class SonySendNewSms {};
		class SonySendSmsContact {};
		class lbChangedSmsSony {};
		class updateSmsSony {};
		class SonySendReplySms {};
	};
	class Bourse {
		file = "\ALF_Client\ALF_System\Bourse";
		class checkPrice {};
		class achatNombre {};
		class listboxPrice {};
		class loadlbPrice {};
		class updateClientBourse {};
		class returnPrice {};
	};

	class Vehicles {
		file = "\ALF_Client\ALF_System\Vehicles";
		class insureSystem {};
		class menuVehicles {};
		class showCarStats {};
		class showCarBtn {};
		class showCivBtn {};
	};

	class Station {
		file = "\ALF_Client\ALF_System\Station";
		class buyStation {};
		class initStation {};
		class sellStation {};
		class stationMenu {};
	};
};

class Life_Client_Core {
	tag = "life";

	class Actions {
		file = "\ALF_Client\core\actions";
		class arrestAction {};
		class buyLicense {};
		class captureHideout {};
		class catchFish {};
		class dpFinish {};
		class dropFishingNet {};
		class escortAction {};
		class gather {};
		class getDPMission {};
		class gutAnimal {};
		class healHospital {};
		class impoundAction {};
		class mine {};
		class packupSpikes {};
		class pickupMoney {};
		class postBail {};
		class pulloutAction {};
		class pushVehicle {};
		class putInCar {};
		class removemobilier {};
		class repairTruck {};
		class restrainAction {};
		class robAction {};
		class searchAction {};
		class searchVehAction {};
		class seizePlayerAction {};
		class serviceChopper {};
		class stopEscorting {};
		class storeVehicle {};
		class surrender {};
		class ticketAction {};
		class unrestrain {};
	};

	class Admin {
		file = "\ALF_Client\core\admin";
		class adminCompensate {};
		class adminDebugCon {};
		class adminFreeze {};
		class admingetID {};
		class adminGodMode {};
		class adminid {};
		class admininfo {};
		class adminMarkers {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
	};

	class Civilian {
		file = "\ALF_Client\core\civilian";
		class civLoadout {};
		class civMarkers {};
		class demoChargeTimer {};
		class freezePlayer {};
		class jail {};
		class jailMe {};
		class knockedOut {};
		class knockoutAction {};
		class removeLicenses {};
		class robPerson {};
		class robReceive {};
		class tazed {};
	};

	class Config {
		file = "\ALF_Client\core\config";
		class houseConfig {};
		class taxRate {};
		class vehicleAnimate {};
	};

	class Cop {
		file = "\ALF_Client\core\cop";
		class bountyReceive {};
		class copInteractionMenu {};
		class copLights {};
		class copLoadout {};
		class copMarkers {};
		class copSiren {};
		class doorAnimate {};
		class fedCamDisplay {};
		class licenseCheck {};
		class licensesRead {};
		class questionDealer {};
		class radar {};
		class repairDoor {};
		class restrain {};
		class seizeClient {};
		class sirenLights {};
		class spikeStripEffect {};
		class ticketGive {};
		class ticketPaid {};
		class ticketPay {};
		class ticketPrompt {};
		class wantedGrab {};
	};

	class Dialog_Controls {
		file = "\ALF_Client\dialog\function";
		class bankDeposit {};
		class bankTransfer {};
		class bankWithdraw {};
		class displayHandler {};
		class gangDeposit {};
		class gangWithdraw {};
		class garageLBChange {};
		class impoundMenu {};
		class progressBar {};
		class safeFix {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class sellGarage {};
		class setMapPosition {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class unimpound {};
		class vehicleGarage {};
		class wireTransfer {};
	};

	class Functions	{
		file = "\ALF_Client\core\functions";
		class accType {};
		class actionKeyHandler {};
		class animSync {};
		class clearVehicleAmmo {};
		class dropItems {};
		class escInterupt {};
		class fetchCfgDetails {};
		class fetchDeadGear {};
		class fetchVehInfo {};
		class isDamaged {};
		class giveDiff {};
		class handleDamage {};
		class handleItem {};
		class hideObj {};
		class inventoryClosed {};
		class inventoryOpened {};
		class silentGearSave {};
		class isnumeric {};
		class isUIDActive {};
		class keyHandler {};
		class loadDeadGear {};
		class loadGear {};
		class nearATM {};
		class nearestDoor {};
		class nearUnits {};
		class numberText {};
		class onFired {};
		class playerCount {};
		class playerTags {};
		class pullOutVeh {};
		class pushObject {};
		class receiveItem {};
		class revealObjects {};
		class saveGear {};
		class searchPosEmpty {};
		class simDisable {};
		class stripDownPlayer {};
		class tazeSound {};
		class teleport {};
	};

	class Gangs	{
		file = "\ALF_Client\core\gangs";
		class createGang {};
		class gangCreated {};
		class gangDisband {};
		class gangDisbanded {};
		class gangInvite {};
		class gangInvitePlayer {};
		class gangKick {};
		class gangLeave {};
		class gangMenu {};
		class gangNewLeader {};
		class gangUpgrade {};
		class initGang {};
	};

	class Housing {
		file = "\ALF_Client\core\housing";
		class buyHouse {};
		class mobilierMenu {};
		class copBreakDoor {};
		class copHouseOwner {};
		class garageRefund {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class placeMobilier {};
		class PlayerInBuilding {};
		class sellHouse {};
	};

	class Items	{
		file = "\ALF_Client\core\items";
		class blastingCharge {};
		class boltcutter {};
		class defuseKit {};
		class flashbang {};
		class jerryRefuel {};
		class lockpick {};
		class spikeStrip {};
		class mobilierSystem {};
		class placeMobilierAction {};
		class setDirMobilier {};
	};

	class Medical_System {
		file = "\ALF_Client\core\medical";
		class deathScreen {};
		class medicLights {};
		class medicLoadout {};
		class medicMarkers {};
		class medicRequest {};
		class medicSiren {};
		class medicSirenLights {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class requestMedic {};
		class respawned {};
		class revived {};
		class revivePlayer {};
	};

	class Network {
		file = "\ALF_Client\core\functions\network";
		class broadcast {};
		class corpse {};
		class jumpFnc {};
		class say3D {};
		class setFuel {};
		class soundDevice {};
	};

	class Player_Menu {
		file = "\ALF_Client\core\pmenu";
		class cellphone {};
		class p_openMenu {};
		class p_updateMenu {};
		class pardon {};
		class wantedAddP {};
		class wantedInfo {};
		class wantedList {};
		class wantedMenu {};
	};

	class Shops	{
		file = "\ALF_Client\core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class clothingFilter {};
		class clothingMenu {};
		class fuelLBchange {};
		class fuelStatOpen {};
		class vehicleShop3DPreview {};
		class vehicleShopBuy {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShopLBChange {};
		class vehicleShopMenu {};
		class weaponShopBuySell {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopFilter {};
		class dispoVehicle {};
		class itemsVenteMenu {};
		class itemsVenteLoad {};
		class itemsVenteSelection {};
		class itemsVente {};
	};

	class Vehicle {
		file = "\ALF_Client\core\vehicle";
		class addVehicle2Chain {};
		class deviceMine {};
		class FuelRefuelcar {};
		class fuelStore {};
		class fuelSupply {};
		class lockVehicle {};
		class vehiclecolor3DRefresh {};
		class vehicleOwners {};
		class vInteractionMenu {};
	};
};
