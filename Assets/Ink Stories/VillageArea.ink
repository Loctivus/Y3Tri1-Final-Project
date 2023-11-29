===Village===

-> DONE

=ArrivalByMerchant
    You ride in the back of Helmund's wagon towards Teveran. #TravelToLocation
    Eventually the wagon comes to a stop and Helmund knocks on the wagon door. #DeactivateCho2Objs ActivateCho2Objs
    "We're here, come on out!" he tells you through the wagon door. #FadeFromBlack
    -> DONE


=House1Knock
    {
     - House1Knock == 1:
        You lightly knock on the door.
        ...
        ...
        No response.
     
     - House1Knock == 2:
        You knock again on the door.
        ...
        ...
        No response again.
     
     - House1Knock == 3:
        You knock for a third time.
        ...
        "WILL YOU GO AWAY!?" screams a villager from inside. #ToggleTriggerOff
        ~villageRep -= 1
     
    }
    -> CheckVillageInteractions

=House2Knock
    {
     - House2Knock == 1:
        You lightly knock on the door.
        ...
        ...
        No response.
     
     - House2Knock == 2:
        You knock again on the door.
        ...
        ...
        No response again.
     
     - House2Knock == 3:
        You knock for a third time.
        ...
        ...
        Seems nobody is inside. #ToggleTriggerOff
    }
    -> CheckVillageInteractions

    
=Dockyard
    {
     - Dockyard == 1:
        You approach to the worker at the docks.
        "Dockyard's closed. Nothin' going in or outta this dock."
    
     - Dockyard == 2:
        You approach the worker again.
        "I already told ya, dock's closed. Now get lost."
     
     - Dockyard >= 3:
        You approach the worker for a third time.
        "You deaf? Get outta here already!" #ToggleTriggerOff
        ~villageRep -= 1
        
    }
    -> CheckVillageInteractions

=CheckVillageInteractions
    {House1Knock && House2Knock && Dockyard:
        {
         - prologueChoice == "Crewmate" && cmPathSplit == false:
            Varker turns to you.
            "Well, this village seems to be pretty empty, not to mention unkind to outsiders."
            "Maybe we should head to Villion Forest and see what's over there?"
            
         - prologueChoice == "Crewmate" && cmPathSplit == true:
            You find that there isn't much else to do in Teveran.
            Perhaps finding Varker in Villion Forest may be better for now.
         - else:
            You find that there isn't much else to do in Teveran.
            Maybe going to Villion Forest will yield better results.
        }
        
        {ArrivalByMerchant:
            You start to make your way to the forest. #DeactivateCho1Objs #ActivateCho2Objs
         - else:
            You start to make your way to the forest. #ActivateCho1Objs #DeactivateCho2Objs
        }
    }
    -> DONE








