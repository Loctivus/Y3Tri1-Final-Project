===DarkForest===
-> DONE

===Graveyard
    -> DONE

=OpenedCoffin
    {prologueChoice == "Crewmate" && cmPathSplit == false:
        "Well I guess grave diggers already ransacked this place."
        You tell Varker that the coffin is completely empty, there is no body.
        "I guess you have a point, but why would someone steal a corpse?"
     - else:
        You look inside the coffin only to find nothing but dust and dirt littering the bottom of it.
        You ponder whether grave diggers have been here, yet why they would steal the corpse itself leaves you bewildered.
    }
    -> DONE

=CultAttack
    "Get 'em boyz!" shrieks a voice behind you as something smashes against the back of your head, knocking you briefly unconcious. #FadeToBlack
    As you start to regain conciousness, you can hear bickering nearby.
    "Let's just gut 'em now! What use are they?"
    "You stupid, ya git? They might get us the gem thing the boss has been wantin' from the crypt here!"
    "Oi, they's startin' to wake up!" #ActivateCho1Objs #FadeFromBlack
    As your eyes open, you see a gang of goblins surrounding you.
    "Well well, look who's awake boys."
    {inventoryItems ? HasDagger:
        You quickly reach for the dagger on your belt, but grasp at nothing.
        "Lookin for this?" taunts one of the goblins, dangling the dagger by its handle while the others laugh.
    }
    -> CultEncounter
    
=CultEncounter
    {prologueChoice == "Crewmate" && cmPathSplit == false:
        "So you and your friend there might be of use to us."
        "Which one of you lads wants to go get a shiny thing from the crypt?" One of them asks.
        {varkerRep < 0:
            Varker yelps to the goblins "Make him do it, I've got useful information your boss might want!"
            You stare at Varker with an enraged yet shocked face.
            The goblins collectively laugh at Varker.
            "Wow, this git was quick to throw you in the mud, Ivaran!"
            
            * [Go into the crypt] You reluctantly agree to be sent into the crypt.
                "Good lad!" boasts one of the goblins "As long as you come back with the shiny, we might let ya go." #FadeToBlack
                -> CryptEnding
                
            * [Demand to be taken instead] You counter Varker by demanding to be taken yourself.
                "Oh yeah? Why take you instead?"
                
                * * {inventoryItems ? HasTalisman}[Show the talisman] You show off the talisman to the goblins, clutching it tightly.
                    Varker scorns you, "You idiot! Joran said we had to keep it safe!"
                    "Quiet ya idiot!" shrieks one of the goblins at Varker.
                    "Oi! Ain't that one of the shinies the boss is lookin for?"
                    You tell them if they take you to the boss, you'll give it to them.
                    "How come we don't just kill you and take it?"
                    You quickly come up with the lie that without you, the talisman's special ability can't be harnessed.
                    "He's lying!" one of them exclaims.
                    "How do you know, ya git? Only the boss knows about these shinies!"
                    "You wanna be the one to tell him you got him a shiny that don't work?"
                    "And get me head smashed? No way!"
                    You awkwardly stand there as they start bickering with each other again.
                    "Enough ya gits!"
                    "Alright Ivaran, we'll take you to the boss. Get Movin!"
                    -> CapturedEnding
                
                * * [Come up with a lie] You lie to the goblins that you are a captain of the Ivaran Fleet.
                    "Is that so?" the goblins asks.
                    "He's lying!" Varker interjects, "He's not the captain, we're both privates!"
                    "You got anything to prove you are the 'Captain'?"
                    
                    * * * {inventoryItems ? HasCrest} [Show the crest] You show the crest to the band of goblins.
                        The goblins gawk at it, bewildered by it.
                        "...that meant to mean somethin?"
                        You explain that only captains have this crest as proof of their rank.
                        "He found that on the beach we washed up on!" Varker interrupts.
                        "Quiet! 
                        ->CapturedEnding
                        
                    * * * [Show nothing] You tell the goblins that you have no physical proof.
                        "See? He was lying! As if someone like him would be a captain!" says Varker.
                        "So you don't have proof, just wastin our time!"
                        "Get him in the crypt boys, I'm tired of the Ivaran's yappin!"#FadeToBlack
                        ->CryptEnding
                
        
         - else:
            "I'll go, send me in." Says Varker.
            
            * [Let Varker go] You stay quiet, letting Varker offer himself to delve into the crypt.
                ->CapturedEnding
            * [Offer to go instead] You interject and try to convince the goblins to send you instead.
                "I don't trust both of ya goin in! Might scurry out somewhere else like rats."
                "I'll let a coin decide who goes in."
                The goblin flicks a coin high into the air. #FadeToBlack
            ~temp whoGoesCrypt = "{~Draven|Varker}"
                {whoGoesCrypt == "Draven":
                    ->CryptEnding
                 - else:
                    ~varkerCryptVolunteer = true
                    ->CapturedEnding
                }
        }
        
     - else:  
        "Okay Ivaran, you got two options here."
        "Go in that crypt and get us the shiny our boss wants..."
        "Or get killed 'ere and we'll find someone else to get it."
        
        * [Agree to go] You reluctantly agree to go in the crypt
            "Good lad!" boasts one of the goblins, "As long as you come back with the shiny, we might let ya go." #FadeToBlack
            -> CryptEnding
        
        * [Demand to meet their boss] You demand the goblins that they take you to their boss instead.
            "Oh yeah? Why should we?"
            You lie that you are a captain of the Ivaran fleet.
            "Is that so?" the goblins asks.
            "You got anything to prove it, 'Captain'?"
            * * {inventoryItems ? HasCrest} [Show the crest]
                You show the crest to the band of goblins.
                The goblins gawk at it, bewildered by it.
                "...that meant to mean somethin?"
                You explain that only captains have this crest as proof of their rank.
                "Huh, guess you do got proof."
                -> CapturedEnding
            
            * * {inventoryItems ? HasTalisman} [Show the talisman] You grab the talisman from your pocket and show it to the goblins, clenching it with your hand.
                "Oi! Ain't that one of the shinies the boss is lookin for?"
                You tell them if they take you to the boss, you'll give it to them.
                "How come we don't just kill you and take it?"
                You quickly come up with the lie that without you, the talisman's special ability can't be harnessed.
                "He's lying!" one of them exclaims.
                "How do you know, ya git? Only the boss knows about these shinies!"
                "You wanna be the one to tell him you got him a shiny that don't work?"
                "And get me head smashed? No way!"
                You awkwardly stand there as they start bickering with each other again.
                "Enough ya gits!"
                "Alright Ivaran, we'll take you to the boss. Get Movin!" #FadeToBlack
                -> CapturedEnding
            
            * * [Show nothing] You tell the goblins that you have no physical proof.
                "So you don't have proof, just wastin our time!"
                "Get him in the crypt boys, I'm tired of the Ivaran's yappin!" #FadeToBlack
                -> CryptEnding
    }
     
=VarkerAttacked
    As you enter the graveyard you see Varker being surrounded by a band of goblins.
    They appear to be interrogating him and gesturing towards a crypt.
    What do you do?
    
    * [Try to sneak up on them] You attempt to sneak up and ambush the goblins.
        "Hey! We got another one!" #FadeToBlack
        They all quickly turn and stare at you crouched near the ground. #TravelToLocation
        ~cmPathSplit = false
        -> CultEncounter
    
    * [Stay hidden] You keep hiding from the goblins and wait to see what happens.
        {varkerTalisman == true:
            As you watch, you see a goblin reach into Varker's pocket and pull out the talisman he took from Joran!
            The goblin shoves it into their own pocket, and begin to march him down the path towards the hills. #FadeToBlack
        
            -> CapturedEnding
        
         - else:
            As you watch, the goblins start to push Varker towards the crypt. #FadeToBlack
            -> CryptEnding
        }
    
    -> DONE 
        
=CryptEnding
    {VarkerAttacked:
        The goblins push open the heavy crypt doors and force Varker inside before following after him.
        You sneak up to the crypt entrance and can see the faint torch light up the walls from around a corner.
        You follow the goblin group and Varker into the crypt, wondering what they are doing in there... #Ending
        
     - else:    
        {prologueChoice == "Crewmate" && cmPathSplit == false:
            "We're wastin time here!" screeches one of the goblins.
            "Alright, alright!" roared another.
            "Send this one into the crypt!" pointing towards you.
            "This one comes with us." pointing to Varker.
            The goblins prod you towards the crypt, with others pushing the heavy stone doors open.
            All they give you is a lit torch.
            Once open, you are prodded further inside and the doors begin to close.
            As the doors close, you get one last glance at Varker, who looks back with an air of worry for your safety.
            Once fully shut, you are plunged into darkness, the torch granting only a short view around you.
            You descend into the crypt... #Ending
            
         - else:
            The goblins prod you towards the crypt, with others pushing the heavy stone doors open.
            All they give you is a lit torch.
            Once open, you are prodded further inside and the doors begin to close.
            Once fully shut, you are plunged into darkness, the torch granting only a short view around you.
            You descend into the crypt... #Ending
        }
    }
    -> DONE
     
=CapturedEnding
    {VarkerAttacked:
        You keep yourself down low and try to follow.
        Wherever they are going, you will find out where they are taking Varker... #Ending    
        
     - else:
        {prologueChoice == "Crewmate" && cmPathSplit == false:
            {varkerCryptVolunteer == false:
                "What about his friend 'ere?"
                "Chuck him in the crypt already, there's still the shiny in there we gotta get." #FadeToBlack
                The goblins prod Varker towards the crypt, prodding him inside and throwing a torch at him.
                As the crypt doors close, Varker gives you one last glance.
                The goblins begin marching you down the path towards the hills... #Ending
                
             - else:
                "Alright, send that one into the crypt." Orders one of the goblins, pointing at Varker. #FadeToBlack
                The goblins prod Varker towards the crypt, prodding him inside and throwing a torch at him.
                As the crypt doors close, Varker gives you one last glance.
                "You're comin with us." says another goblin to you.
                The goblins begin marching you down the path towards the hills... #Ending
            }
            
         - else:
            "Alright ,Ivaran, we'll take you to the boss." #FadeToBlack
            "But if our boss don't like ya, you're becoming our battle-boars' next meal."
            The goblins form around you and prod you to start moving down the path towards the hills.
            You begin walking, onwards to meet the goblins' boss...#Ending
        }
    }
    -> DONE

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    














