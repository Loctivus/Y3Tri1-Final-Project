using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class StoryInteraction : BaseInteraction
{
    public Transform travelLocation;
    public GameObject varkerAmbush;

    public List<GameObject> choice1ObjsToEnable = new List<GameObject>();
    public List<GameObject> choice1ObjsToDisable = new List<GameObject>();

    public List<GameObject> choice2ObjsToEnable = new List<GameObject>();
    public List<GameObject> choice2ObjsToDisable = new List<GameObject>();

    public List<ItemInteraction> itemsCanGain = new List<ItemInteraction>(); //put item objs which can be earned from this story knot
    public Image blackScreen; //Image for fading to and from a black screen
    public GameObject endScreen;
    void Start()
    {
        mainStoryRef = StoryManager.sMInst.mainStory;
        endScreen.SetActive(false);
        nextLinePromptObj.SetActive(false);
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E) && activeRange && canGoToNextLine)
        {
            if (inkTags.Count > 0)
            {
                for (int i = 0; i < inkTags.Count; i++)
                {
                    InkTagCheck(inkTags[i].ToString());
                }
            }
            RefreshText();
        }
    }

    public override void Interaction()
    {
        Debug.Log(mainStoryRef);
        mainStoryRef.ChoosePathString(interactionKnot);
        RefreshText();
        SwitchPlayerMovement();

        if (PlayerInventory.pInv.invPanel.activeSelf)
        {
            PlayerInventory.pInv.invPanel.SetActive(false);
        }
    }

    void RefreshText()
    {
        ClearCanvasChildren();

        if (mainStoryRef.canContinue)
        {
            string text = mainStoryRef.Continue();
            StartCoroutine(DisplayText(text));
        }

        inkTags = mainStoryRef.currentTags;

        if (mainStoryRef.currentChoices.Count > 0)
        {
            nextLinePromptObj.SetActive(false);
            for (int i = 0; i < mainStoryRef.currentChoices.Count; i++)
            {
                Choice choice = mainStoryRef.currentChoices[i];
                Button button = CreateChoiceButton(choice.text.Trim());
                button.onClick.AddListener(delegate
                {
                    ClickChoice(choice);
                });
            }
        }
        else
        {
            if (mainStoryRef.canContinue == false)
            {
                nextLinePromptObj.SetActive(false);
                activeRange = false;
                Button choice = CreateChoiceButton("Continue");

                if (inkTags.Count > 0)
                {
                    Debug.Log("Ink tags to check");
                    for (int i = 0; i < inkTags.Count; i++)
                    {
                        Debug.Log(inkTags[i]);
                        InkTagCheck(inkTags[i]);
                    }
                }

                choice.onClick.AddListener(delegate
                {
                    StopAllCoroutines();
                    SwitchPlayerMovement();
                    PlayerInventory.pInv.AllowInvShow();
                    ClearCanvasChildren();
                });
            }
        }
    }

    void ClickChoice(Choice choice)
    {
        mainStoryRef.ChooseChoiceIndex(choice.index);
        if (inkTags.Count > 0)
        {
            InkTagCheck(inkTags[0].ToString());
        }
        StopAllCoroutines();
        RefreshText();
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player") && gameObject.CompareTag("EnvStoryTrigger"))
        {
            activeRange = true;
            Interaction();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Player") && gameObject.CompareTag("EnvStoryTrigger"))
        {
            activeRange = false;
        }
    }

    void InkTagCheck(string inkTag)
    {
        switch (inkTag)
        {
            case "FadeFromBlack":
                blackScreen.gameObject.GetComponent<Animator>().SetTrigger("FadeFromBlack");
                break;

            case "FadeToBlack":
                blackScreen.gameObject.GetComponent<Animator>().SetTrigger("FadeToBlack");
                break;

            case "GainItem0":
                itemsCanGain[0].AddToInv();
                break;

            case "GainItem1":
                itemsCanGain[1].AddToInv();
                break;

            case "GainItem2":
                itemsCanGain[2].AddToInv();
                break;

            case "TogglePlayer":
                
                if (PlayerMove.moveRef.playerBody.activeSelf)
                {
                    PlayerMove.moveRef.playerBody.SetActive(false);
                }
                else
                {
                    PlayerMove.moveRef.playerBody.SetActive(true);
                }
                break;

            case "TravelToLocation":
                if (travelLocation != null)
                {
                    PlayerMove.moveRef.gameObject.transform.position = travelLocation.position;
                }
                break;
                

            case "ActivateCho1Objs":
                if (choice1ObjsToEnable != null)
                {
                    for (int i = 0; i < choice1ObjsToEnable.Count; i++)
                    {
                        choice1ObjsToEnable[i].SetActive(true);
                    }
                }
                break;

            case "DeactivateCho1Objs":
                if (choice1ObjsToDisable != null)
                {
                    for (int i = 0; i < choice1ObjsToDisable.Count; i++)
                    {
                        choice1ObjsToDisable[i].SetActive(false);
                    }
                }
                break;

            case "ActivateCho2Objs":
                if (choice2ObjsToEnable != null)
                {
                    for (int j = 0; j < choice2ObjsToEnable.Count; j++)
                    {
                        choice2ObjsToEnable[j].SetActive(true);
                    }
                }
                break;

            case "DeactivateCho2Objs":
                if (choice2ObjsToDisable != null)
                {
                    for (int j = 0; j < choice2ObjsToDisable.Count; j++)
                    {
                        choice2ObjsToDisable[j].SetActive(false);
                    }
                }
                break;

            case "Ending":
                endScreen.SetActive(true);
                break;

            case "ToggleCompanion":
                if (CompanionMovement.comMoveRef.companionAlive)
                {
                    if (CompanionMovement.comMoveRef.gameObject.activeSelf)
                    {
                        CompanionMovement.comMoveRef.charModel.SetActive(false);
                    }
                    else
                    {
                        CompanionMovement.comMoveRef.charModel.SetActive(true);
                    }
                }
                break;

            case "ToggleTriggerOff":
                BoxCollider trigger = gameObject.GetComponent<BoxCollider>();
                trigger.enabled = false;
                break;

            case "TogglePrologueSounds":
                SoundManager.sMInst.TurnDownPrologueSFX();
                break;

            case "ToggleVarkerAmbush":
                varkerAmbush.SetActive(true);
                break;
        }
    }
}
