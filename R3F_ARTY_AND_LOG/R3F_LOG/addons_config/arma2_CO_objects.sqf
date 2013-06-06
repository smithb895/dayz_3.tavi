/**
 * English and French comments
 * Commentaires anglais et fran�ais
 * 
 * This file contains the configuration variables of the logistics system.
 * Fichier contenant les variables de configuration du syst�me de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes d�rivant de celles utilis�es dans les variables de configuration seront aussi valables.
 */

/*
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 * 
 * Deux moyens existent pour g�rer de nouveaux objets avec le syst�me logistique. Le premier consiste � ajouter
 * ces objets dans les listes appropri�es ci-dessous. Le deuxi�me est de cr�er un fichier externe dans le r�pertoire
 * /addons_config/ selon le m�me sch�ma que ceux qui existent d�j�, et d'ajouter un #include � la fin de ce pr�sent fichier.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des v�hicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs =
[
	"Truck",
	"Ural_Base",
	"TowingTractor",
	"Tractor",
	"LandRover_Base",
	"LandRover_CZ_EP1",
	"hilux_civil_1_open",
	"hilux1_civil_3_open_EP1",
	"Hmmwv_Base",
	"Uaz_Base"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables =
[
	"hilux_civil_1_open",
	"hilux1_civil_3_open_EP1",
	"Hmmwv_base",
	"Lada_Base",
	"LandRover_Base",
	"LandRover_CZ_EP1",
	"kh_maule_m7_white_DZ",
	"kh_maule_m7_white",
	"SkodaBase",
	"SUV_Base_EP1",
	"Uaz_Base",
	"VW_Golf",
	"Volha_TK_CIV_Base_EP1"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des v�hicules a�riens pouvant h�liporter des objets h�liportables.
 */
R3F_LOG_CFG_heliporteurs =
[
	"UH1H_DZ",
	"Mi17_DZ"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets h�liportables.
 */
R3F_LOG_CFG_objets_heliportables =
[
	"ATV_Base_EP1",
	"hilux_civil_1_open",
	"hilux1_civil_3_open_EP1",
	"Hmmwv_base",
	"Lada_Base",
	"LandRover_Base",
	"LandRover_CZ_EP1",
	"RubberBoat",
	"PBX_DZ",
	"SkodaBase",
	"SUV_Base_EP1",
	"SkodaBase",
	"Uaz_Base",
	"VW_Golf",
	"M1030",
	"TT650_Base",
	"Tractor",
	"Old_bike_base_EP1",
	"Volha_TK_CIV_Base_EP1"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le r�f�rentiel arbitraire utilis� est : une caisse de munition de type USVehicleBox "p�se" 12 unit�s.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorit� d'une d�claration de capacit� sur une autre correspond � leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient � la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est d�clar� avec une capacit� de 140 avant "Car". Et que "Car" est d�clar� apr�s "Truck" avec une capacit� de 40,
 *   Alors toutes les sous-classes appartenant � "Truck" auront une capacit� de 140. Et toutes les sous-classes appartenant
 *   � "Car", except�es celles de "Truck", auront une capacit� de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des v�hicules (terrestres ou a�riens) pouvant transporter des objets transportables.
 * Le deuxi�me �l�ment des tableaux est la capacit� de chargement (en relation avec le co�t de capacit� des objets).
 */
R3F_LOG_CFG_transporteurs =
[
	["hilux_civil_1_open", 175],
	["hilux1_civil_3_open_EP1",175],
	["hilux1_civil_2_covered", 175],
	["hilux1_civil_3_open", 175],
	["datsun1_civil_1_open", 175],
	["Hmmwv_base", 50],
	["Lada_Base", 50],
	["LandRover_Base",100],
	["LandRover_CZ_EP1", 100],
	["SUV_Base_EP1", 50],
	["car_hatchback", 50],
	["car_sedan", 50],
	["Skoda", 50],
	["SkodaRed", 50],
	["SkodaBlue", 50],
	["SkodaGreen", 50],
	["Uaz_Base", 50],
	["VW_Golf", 50],
	["Truck", 250],
	["Ural_Base", 250]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxi�me �l�ment des tableaux est le co�t de capacit� (en relation avec la capacit� des v�hicules).
 */
R3F_LOG_CFG_objets_transportables =
[
	["M1030", 100],
	["TT650_Base", 100],
	["Old_bike_base_EP1", 100],
	["Bicycle", 50],
	["ATV_Base_EP1",125],
	["hilux_civil_1_open", 251],
	["Hmmwv_Base", 251],
	["Uaz_Base", 251],
	["LandRover_CZ_EP1", 251],
	["LandRover_Base", 251],
	["PBX_DZ",150],
	["RubberBoat",150],
	["SkodaBase", 251],
	["SUV_Base_EP1", 251],
	["Lada_base", 251],
	["VW_Golf", 251],
	["Truck", 251],
	["Tractor", 251]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */
R3F_LOG_CFG_objets_deplacables =
[
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalit�s logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
//#include "addons_config\ACE_OA_objects.sqf"
//#include "addons_config\BAF_objects.sqf"
//#include "addons_config\arma2_CO_objects.sqf"