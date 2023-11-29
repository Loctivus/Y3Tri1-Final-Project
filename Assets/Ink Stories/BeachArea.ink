===BeachStart===
You open your eyes to find yourself along a small shoreline.
{ prologueChoice:
    - "Treasure":
        Nearby is the rowboat you were on before falling into the Vespian Sea, with something shining in your eye from the sunlight.
        -> DONE
    - "Crewmate":
        As you stand up, you see Varker rushing to you.
        -> SavedCrewmate
    - "SaveSelf":
        -> SavedSelf
}

=SavedCrewmate
    {SavedCrewmate >= 2}"Oh thank goodness! I was starting to worry that you wouldn't wake up!"
    * [Where are we?] You ask Varker if he has any idea where you are.
        "I was hoping you would know. Geography was never my strong suit at the academy."
        "All I know is we are a long way from Ivara."
        -> SavedCrewmate
    * [Passed out?] You ask Varker how long you were passed out.
        "I'm not too sure, I've only been awake myself for a few moments."
        -> SavedCrewmate
        
    * [Look around] You tell Varker you should both start looking around the area.
         "Sounds like a good idea, maybe something from the ship drifted ashore."
         
        -> DONE
        
=SavedSelf
    -> DONE
    
===FoundCaptain
    Getting a closer look, you see that it's Captain Joran! He seems to be passed out, much like you were moments ago. 
    * [Pick Joran's pockets] You rummage through Joran's pockets looking for anything useful.
        {prologueChoice == "Crewmate":
            "Draven what are you doing?! You're already picking his pockets!? He may still be alive!" exclaims Varker while you rummage.
            ~varkerRep -= 1
        }
        
        You manage to find a pouch of gold coins and a strange talisman with a clasp at its base.
        
        * * [Put them back] You put the pouch and talisman back into Joran's pockets.
            
        -> FoundCaptain
        * * [Take them] You slot the pouch and talisman into your own pockets #GainItem0 #GainItem1
            
            ~inventoryItems += HasGoldPouch
            ~inventoryItems += HasTalisman
        -> FoundCaptain
        
    * [Help the captain]
        You put your fingers to Joran's neck, trying to find some sort of pulse...
        ...
        ...
        ...
        No pulse is felt on your fingers.
        -> AssistCaptain
        
    * [Walk away] You stand up to walk away from Joran, leaving him leant against the rocks.
        {prologueChoice == "Crewmate":
            "You're just going to walk away?" Varker questioned.
            You tell Varker that there isn't much else that you can really do.
            "Well we can't just leave him here!"
            You and Varker continue to argue until a heavy cough and sputter interrupt you both.
            ~varkerRep -= 1
            -> CaptainWakes
            -else:
            As you turn to walk away, you feel something grasp at your leg.
            -> CaptainWakes
        }
        

=AssistCaptain
    {prologueChoice == "Crewmate":
        You tell Varker he has no pulse and work together to resuscitate him.
    
     - else:
        You immediately attempt to resuscitate him, hopeful of the chance he will live.
    }
    
    Eventually Joran lets out a cough, sputtering out seawater from his mouth.
    -> CaptainWakes

=CaptainWakes
    {
     - prologueChoice == "Crewmate":
        "Draven? Varker? Thank the gods someone else survived that damned mess." Joran coughs as more seawater drips down his chin.
        "You need to get back to Ivara and explain what happened to the council."
        "You need to take this aswell." Joran reaches into his pocket.
        
        {inventoryItems ? HasTalisman:
            "Where is it? Oh no, no, no!" Joran panics, checking his other pockets.
            You show Joran the talisman you found from his pocket, much to his relief.
            "Oh thank goodness! I thought it had been lost to the Vespian Sea!"
            
            
         - else:
            Joran pulls out a strange talisman with a clasp at its base and stretches his hand out.
            {varkerRep <= -1:
                Varker takes the talisman from Joran and tucks it in his pocket.
                "Probably best that I hold on to this." He says while sneaking a judging glance at you as he does so.
                ~varkerTalisman = true
             - else:
                You take the talisman from Joran's hand.
                You clutch the talisman tightly before putting it in your pocket.
                ~inventoryItems += HasTalisman
            }
        }
    
    
     - prologueChoice == "Treasure":
        Joran lets out a heavy cough and sputter has he holds your leg.
        "You dishonourable thief! Men were drowning while you lined your pockets!"
        "You're the last person I was hoping would survive but nonetheless..."
        "You need to get back to Ivara and explain what happened to the council."
        "You need to take this aswell." Joran reaches into his pocket.
        {inventoryItems ? HasTalisman:
            "Where is it? Oh no, no, no!" Joran panics, checking his other pockets.
            You show Joran the talisman you found, much to his relief.
            "Oh thank goodness! I thought it had been lost to the Vespian Sea!"
            "But knowing you, you probably picked this from my pocket before I woke up."
            
         - else:
            Joran pulls out a strange talisman with a clasp at its base and stretches his hand out.
            You take the talisman from Joran's hand.
            You clutch the talisman tightly before putting it in your pocket.
            ~inventoryItems += HasTalisman
        
        }
     - prologueChoice == "SaveSelf":
        Joran lets out a heavy cough and sputter has he holds your leg.
        "You damned coward! Leaving the rest of us to drown!" He sputters.
        "You're the last person I was hoping would survive but nonetheless..."
        "You need to get back to Ivara and explain what happened to the council."
        "You need to take this aswell." Joran reaches into his pocket.
        {inventoryItems ? HasTalisman:
            "Where is it? Oh no, no, no!" Joran panics, checking his other pockets.
            You show Joran the talisman you found from his pocket, much to his relief.
            "Oh thank goodness! I thought it had been lost to the Vespian Sea!"
            
         - else:
            Joran pulls out a strange talisman with a clasp at its base and stretches his hand out.
            You take the talisman from Joran's hand.
            You clutch the talisman tightly before putting it in your pocket.
            ~inventoryItems += HasTalisman
        }
    }
    
"Whatever you do, do not let anyone get that talisman. Take it back to Ivara where it is safe."
"I will stay here for a while longer and try to regain my strength."
"Good Luck..." Joran utters as he drifts into slumber. #ToggleTriggerOff
-> DONE


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    