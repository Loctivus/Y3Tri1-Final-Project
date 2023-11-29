INCLUDE PrologueStory.ink
INCLUDE BeachArea.ink
INCLUDE Inventory Items.ink
INCLUDE Crossroads.ink
INCLUDE VillageArea.ink
INCLUDE DarkForestArea.ink
INCLUDE MerchantInteraction.ink


LIST inventoryItems = HasCrest, HasGoldIngot, HasGoldPouch, HasTalisman, HasRations, HasDagger
VAR prologueChoice = ""

VAR cmPathSplit = false


//Varker
VAR varkerRep = 0
VAR varkerTalisman = false
VAR varkerCryptVolunteer = false
VAR varkerSneak = false

//Merchant 
VAR merchantRep = 0
VAR boughtDagger = false
VAR boughtRations = false

//Village
VAR villageRep = 0

