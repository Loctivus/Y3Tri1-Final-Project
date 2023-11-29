
===Prologue===

The tides of the Vespian Sea throw the Ivaran flagship to near tipping points.
Treasures from the ship's hold are scattered and thrown around on the deck.
Crewmates are dragged along the deck with each wave, throwing them off balance, even flinging some overboard.
Through the sounds of the crashing wave you hear an order ring out across the deck.
"Abandon ship! Everyone abandon ship!"

* [Save the treasure!] You scramble to stuff your pockets with as much gold as you can cling on to, before diving into the rowboat. #ActivateCho1Objs
    "Private Draven! Forget the treasure and help your crew!" screams Captain Joran from the ship's helm.
    You ignore his orders and begin lowering the rowboat.
    ~prologueChoice = "Treasure"
    
* [Save a crewmate!] You grab Private Varker and pull him into the rowboat with you. #ActivateCho2Objs
    You both work together to lower the rowboat onto the ocean.
    ~prologueChoice = "Crewmate"

* [Save yourself!] You turn your back to the deck of the ship and leap into the rowboat.
    The remaining crew watch as you struggle to lower the rowboat, their faces stricken with shock.
    "Private Draven took one of the boats for himself!" Screams a crewmate whilst you lower the rowboat onto the sea.
    "Coward would save his own skin than the rest of us!" Shouts another as you descend.
    ~prologueChoice = "SaveSelf"

    
-As you lower the rowboat into the roaring waves, the ropes snap under the strain of the buckling ship. The splash of the impact drenches{prologueChoice == "Crewmate": Varker and} yourself.

The ocean smothers you with towering waves, with only the crow's nest of the ship visible. With each flash of lightning, you and the ship drift further apart, until a colossal wave charges you, knocking you off the rowboat.

{prologueChoice:
    - "Treasure": 
    As you fall beneath the waves, you can see gold coins, ingots and jewels drifting down alongside you.
    -> PrologueEnd
    - "Crewmate": 
    As you fall beneath the waves, for a moment you can see Varker trying to reach out to grab you, but to no avail.
    -> PrologueEnd
    - else:
    As you fall beneath the waves, you can see the bottom of the rowboat drift away.
    -> PrologueEnd
}

=PrologueEnd
Eventually, the sheer force of the sea batters out whatever air remains in your lungs. As your eyes start to close, you are carried away by the waves... #TogglePrologueSounds
    ...
    ...#FadeFromBlack
    -> BeachStart
    
