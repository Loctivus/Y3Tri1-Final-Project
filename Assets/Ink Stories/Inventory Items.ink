//Any item knots added need to be included in the iventoryItems list as Has[Item Name] for checking purposes

===Crest===
    {inventoryItems ? HasCrest:
        A golden crest bearing the emblem of the Ivaran Consulate, found washed up on the beach. Usually they are worn by captains of the Ivaran Fleet.
       -> DONE
        
     - else:
        You pick up an Ivaran crest off the ground. 
        ~inventoryItems += HasCrest
         
        -> DONE
    }
    
===GoldIngot===
    {inventoryItems ? HasGoldIngot:
        An ingot of gold with the emblem of the Ivaran Consulate stamped on the middle. Found in the rowboat on the beach.
        
     - else: 
        You take a gold ingot from the rowboat. 
        ~inventoryItems += HasGoldIngot
    }
    -> DONE
    
===GoldPouch===
    {inventoryItems ? HasGoldIngot:
        A small, but hefty pouch of gold coins you picked from Joran's pockets.
     - else:
        Picked up gold pouch.
    }
    -> DONE
    
    
===Talisman===    
    {inventoryItems ? HasTalisman:
        A strange talisman given to you by Captain Joran on the beach. Its shape is not recognizable as anything from any of the 5 continents. A golden clasp can be seen at the base, but it does not seem to budge, no matter the force used.
     - else:
        Pick up talisman. 
    }
    -> DONE
    
===Dagger===
    {inventoryItems ? HasDagger:
         A worn dagger you purchased from Helmund in Villion Forest. Its blade is slightly chipped and the leather handle has shown some age.
     - else:
       Took worn dagger.
    }

    -> DONE
    
===FoodRations===
    {inventoryItems ? HasRations:
        A small bundle of food rations you bought from Helmund in Villion Forest.
     - else:
        Took food rations.
    }
    -> DONE
    
    
    
