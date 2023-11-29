===IncomingNoise
    As you walk down the path, you can hear the trotting of hooves and crashing of trees.
    While it comes closer you see the silhouette of a wagon in the distance.
    {prologueChoice == "Crewmate" && cmPathSplit == false: 
        "I don't like that. What do we do?" Varker asks.
     - else:
        What do you do?
    }
    
    * [Hide] You quickly make a dash for the brush of the forest{prologueChoice == "Crewmate":, with Varker quickly following behind you}. #FadeToBlack
        -> HideFromNoise
    * [Stay] You stand in the road, ready for whatever is approaching ahead #FadeToBlack
        {prologueChoice == "Crewmate" && cmPathSplit == false:
            You tell Varker to stand his ground, but to be ready for anything.
         - else:
            As the wagon approaches, you can make out what seems to be the average peasant.
            The sight puts you at ease as they start to slow down and stop next to you. #FadeFromBlack #ActivateCho1Objs
        }
        -> MerchantEncounter

=HideFromNoise   
    As you hide in the bushes, a horse and cart come to a stop just a few feet from you #ActivateCho1Objs #TogglePlayer #FadeFromBlack #ToggleCompanion
    {prologueChoice == "Crewmate":
        Varker whispers to you "They're right in front of us..."
        "Do you think it's worth showing ourselves?"
        "They might get the wrong idea but they could help us."
     - else:
        Do you reveal yourself or keep hiding?
    }

    * [Keep Hiding] You keep as still as you can be, waiting for the wagon to continue on its journey.
        
        The person at the front turns their head, scanning the treeline.
        They focus heavily in your direction, perhaps noticing you.
        Just as though it seems you're spotted, they turn back and continue their journey. 
        You wait for some time to make sure they have gone far enough away. #FadeToBlack
        You step out from the forest and back onto the forest path. #TogglePlayer #FadeFromBlack
        -> DONE
        
    * [Reveal Yourself]
        {prologueChoice == "Crewmate" && cmPathSplit == false:
            You agree with Varker that they may be helpful, and you stand to walk towards the stranger. #FadeToBlack
            Varker whispers to you "Even if they try something its two against one" as he follows you.
         - else:
            You stand to walk towards the merchant, brushing pass the grass and dead trees. #FadeToBlack
        }
        -> MerchantEncounter
        
=MerchantEncounter
    {
     - HideFromNoise:
        You greet the stranger as you proceed, the stranger spooked by your approach. #TogglePlayer #FadeFromBlack
        "Woah! What do you think you're doing just jumping out of the forest like that!?" The stranger screamed.
        "Seems all too convenient, I barely made it past some trees as they fell nearly on top of me!"
            {prologueChoice == "Crewmate" && cmPathSplit == false:
                Varker snaps back "HEY! We are no thieves! We don't even know where we are!"
                "Can't you see that our clothes are soaked with seawater?!"
                ~merchantRep -= 1
                
                * [Calm Varker down] You attempt to calm Varker down.
                    ~varkerRep -= 1
                    "You're telling ME to calm down?! This man is slandering us!"
                    You calmly explain the situation to the stranger, informing them about the storm and what happened.
                    -> MerchantHub
                
                * [Calm the stranger down] You attempt to calm the stranger down
                    ~merchantRep -= 1
                    "Don't you tell me to calm down! You're the ones skulking out of the woods!"
                    You calmly explain the situation to the stranger, informing them about the storm and what happened.
                    -> MerchantHub
                
             - else:
                * [Calm the stranger down]
                    You calmly explain the situation to the stranger, informing them about the storm and what happened.
                    The stranger becomes less tense, but still on their guard "Ah, an unfortunate bit of business for you. My apologies."
                    -> MerchantHub
                * [Snap back]
                    ~merchantRep -= 1
                    You interrupt the stranger and admonish them for these slanderous allegations before explaining your situation.
                    You explain to the stranger what happened in the storm and how you wound up here.
                    "I'm just calling it how I see it, but I guess most thieves wouldn't care this much about being called thieves.
                    -> MerchantHub
            }
            
     - else:
        "Well hello there, not often I find travellers on these roads." says the stranger.
        "Pretty convenient you're here right after those trees back there nearly collapsed on me and my wagon."
        
        {
         - prologueChoice == "Crewmate" && cmPathSplit == false:
            "But I'm sure if you were bandits your clothes wouldn't be damp and reek of the sea."
            Varker explains "We were sailing across the Vespian Sea when we were hit by a tremendous storm."
        
         - prologueChoice == "Crewmate" && cmPathSplit == true:
            "Then again, you appear to be alone and your clothes are soaked through."
            You explain to the stranger what happened in the storm and how you wound up here.
            You also mention that you and Varker had split at the crossroads.
            "Ah, I see. So you and your friend aren't from around here."
         
         - else:
            "Then again, you appear to be alone and your clothes are soaked through."
            You explain to the stranger what happened in the storm and how you wound up here.
            "Ah, I see. A bad bit of business then."
        }
        -> MerchantHub
    }
    
=MerchantHub
    {MerchantHub < 2:
        "I'm Helmund, just a travelling merchant trying to get by. What can I do for you?"
     - else:
        "What else can I do for you?"
    }
    
    + [Ask some questions]
        * * "Where are we?" [] You ask.
            "You boys really are lost, huh. You're in the south of Aerdoros."
            "If you are from Ivara, then I'm afraid you are far from home."
            -> MerchantHub
            
        * * "Where are you going?" [] You ask.
            "Well I'm on my way to Teveran! I will see what I can sell to its people then continue to the next."
            -> MerchantHub
            
        + + [Back]
            -> MerchantHub
        
    + [Ask to Travel] You ask the stranger if you can travel with them to where they are going.
        {HideFromNoise && merchantRep == -2:
            "Normally I would happily welcome you aboard, but you just came skulking out of the forest."
            "No offense to you sir, but that seems very suspicious to me."
            -> MerchantHub
         - else:
            "Well you {prologueChoice == "Crewmate" && cmPathSplit == false:and your friend there} seem nice enough." 
            "You ready to head out? Or you still got something else to do first?"
         
         
            * * [Depart] 
                "Alright, hop on board and we'll get going! #FadeToBlack #ToggleTriggerOff
                -> Village.ArrivalByMerchant
        
            + + [Stay]
                "Sure, just say when you're ready."
                -> MerchantHub
        }
    + [Ask to Trade] You ask the merchant for anything they would be willing to trade any of their wares.
        {HideFromNoise:
            Hmm, alright, but I charge a pretty high price.
            -> MerchantHub
         - else:
            Of course! I only have a few wares for sale though.
            -> MerchantHub
        }
    * [Leave] You tell Helmund you will continue into the forest.
        {HideFromNoise:
            "Well, I'll be on my way as well then." #FadeToBlack
            "Word of advice, try not to be as conspicuous if you have nothing to hide." 
            
         - else:
            "Alrighty, you take care now!" 
            "Personally I wouldn't stick around this forest for too long." #FadeToBlack
            "Stay safe out there!"
            
        }
        Helmund rides onwards as you continue further into the forest. #FadeFromBlack #DeactivateCho1Objs #ToggleTriggerOff
        -> DONE

=MerchantTrading
    {MerchantTrading:
        "What else would you like to trade for?"
     - else:
        "What would you like to trade for?"
    }
    
    + [Back]
        -> MerchantHub
        
    +{boughtDagger == false} [Worn Dagger]
        {HideFromNoise && merchantRep == -1:
            "For the dagger, it'll take quite alot of gold if you want it."
            * * {inventoryItems ? HasGoldIngot} [Trade gold ingot] You offer a gold pouch in return for the dagger.
                "Hmm, Ivaran gold. I would be crazy not to accept this trade."
                "I won't ask how you came to acquire this, but here you go." #GainItem0
                ~inventoryItems -= HasGoldIngot
                ~boughtDagger = true
                ~inventoryItems += HasDagger
                -> MerchantTrading
            
          - else:
            "I can trade the dagger for some gold if you happen to have any on you."
         
            * * {inventoryItems ? HasGoldIngot} [Trade gold ingot] You offer a gold pouch in return for the dagger.
                "Well this trade seems all too good to be true!"
                "I won't ask where you got this, but I'll happily give you the dagger for it!"
                You exchange the gold ingot for the merchant's dagger, both of you examining the respective items.#GainItem0
                ~inventoryItems -= HasGoldIngot
                ~boughtDagger = true
                ~inventoryItems += HasDagger
                -> MerchantTrading
            
            * * {inventoryItems ? HasGoldPouch} [Trade gold pouch] You offer a gold pouch in return for the dagger.
                "Ah, a hefty pouch of gold. This is suitable enough, here's the dagger."#GainItem0
                ~inventoryItems -= HasGoldPouch
                ~boughtDagger = true
                ~inventoryItems += HasDagger
                -> MerchantTrading
        }
        
        + + [Back]
            -> MerchantTrading
            
    +{boughtRations == false} [Food rations]
        {HideFromNoise:
            * * {inventoryItems ? HasGoldPouch} [Trade gold pouch] You offer a gold pouch in return for some food rations.
                "Well...it is quite a hefty pouch of gold. This will do, here's the food." #GainItem1
                ~inventoryItems += HasRations
                ~inventoryItems -= HasGoldPouch
                ~boughtRations = true
                -> MerchantTrading
        
         -  else:
            * * {inventoryItems ? HasGoldPouch} [Trade gold pouch] You offer a gold pouch in return for some food rations.
            "Ah, a hefty pouch of gold. This is suitable enough, here's some food." #GainItem1
                ~inventoryItems += HasRations
                ~inventoryItems -= HasGoldPouch
                ~boughtRations = true
                -> MerchantTrading
            
            * * {inventoryItems ? HasCrest} [Trade crest] You offer the crest in return for some food rations.
                "A crest? How is this worth anything?"
                You explain that only captains of the Ivaran Fleet have this crest as proof of their rank.
                "Oh...well it's not very often you find one of these."
                "I'm sure there is a collector out there that may pay a pretty price for this. Here's the food in exchange for it." #GainItem1
                ~inventoryItems += HasRations
                ~inventoryItems -= HasCrest
                ~boughtRations = true
                -> MerchantTrading
        }
        
        + + [Back]
            -> MerchantTrading
