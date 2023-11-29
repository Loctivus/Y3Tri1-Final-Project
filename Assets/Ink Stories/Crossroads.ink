===CrossRoads===
    You come to a split in the road.
    The sign next to you says the left path will take you to "Teveran".
    the right path says it will take you to "Villion Forest".
    Which path do you take?
    
    {prologueChoice == "Crewmate":
        "With there being 2 paths, do you think it's best for us to split up?" Varker asks.
        *[Split up] You decide to split up and go down different paths.
            "Alright, you choose a path and I'll go down the other one." 
            ~cmPathSplit = true
            -> PathChoice
        *[Stay Together] You decide to stay together and it's too risky to separate.
            "That may be best, safety in numbers until we're better equipped."
            ~cmPathSplit = false
            -> PathChoice
            
     - else:
        -> PathChoice
    }
    
    
=PathChoice
    *[Left Path] You choose to take the path going left.
        {prologueChoice == "Crewmate": 
            {cmPathSplit == true:
                "Alright, you head to Teveran and see what you find."
                "I'll go into Villion Forest, might eventually lead to something that will help us get home." #ActivateCho1Objs #DeactivateCho1Objs #ToggleTriggerOff #ToggleCompanion #ToggleVarkerAmbush
             - else:
                "Alright, let's head to Teveran! I don't trust going into a forest in an unknown land." #ActivateCho1Objs #DeactivateCho1Objs #ToggleTriggerOff
            }
            
            -> DONE
         - else:
            You choose to take the path to Teveran. #ActivateCho1Objs #DeactivateCho1Objs #ToggleTriggerOff
            -> DONE
        }
        
    *[Right Path] You choose to take the path going right.
        {prologueChoice == "Crewmate": 
            {cmPathSplit == true:
                "Alright, you head to Villion Forest and see where you end up."
                "I'll go to Teveran and see what's over there. Sounds like a town or something." #ActivateCho2Objs #DeactivateCho2Objs #ToggleTriggerOff #ToggleCompanion
             - else:
                "Alright, let's head into Villion Forest! Normally I would avoid forests but it might lead us somewhere that helps get us home." #ActivateCho2Objs #DeactivateCho2Objs #ToggleTriggerOff
            }
            
            -> DONE
         - else:
            You choose to take the path to Villion Forest. #ActivateCho2Objs #DeactivateCho2Objs #ToggleTriggerOff
            -> DONE
        }
        
=WrongPath
    {Village.ArrivalByMerchant == 1:
        "I should keep looking around." You say to yourself.
    
     - else: 
        You stop and notice that this isn't the correct path.
    }
    -> DONE
    
=BrokenWagon
    You come across a broken wagon near the split in the road.
    {prologueChoice == "Crewmate" && cmPathSplit == true:
        "This wasn't here earlier..." says Varker.
        "What do you think happened? Especially to the driver and horse."
        You can only shrug your shoulders at Varker, no clear answer can be given from just a wreckage.
     - else:
        You wonder what happened to the driver and their horse.
        The wagon wreck does not give a clear indicator to their fates.
    }
    -> DONE
    
    
    
    
    
