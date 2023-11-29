using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;

public class ItemInteraction : BaseInteraction
{
    public string itemName;
    public override void Interaction()
    {
        base.Interaction();
        AddToInv();
        PlayerInventory.pInv.canOpenInv = false;
        
        mainStoryRef.ChoosePathString(itemName);
        PickUpDisplay();
        SwitchPlayerMovement();

        if (PlayerInventory.pInv.invPanel.activeSelf)
        {
            PlayerInventory.pInv.invPanel.SetActive(false);
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E) && activeRange && canGoToNextLine)
        {
            PickUpDisplay();
        }
    }

    public void AddToInv()
    {
        PlayerInventory.pInv.items.Add(this);

    }

    void PickUpDisplay()
    {
        ClearCanvasChildren();

        if (mainStoryRef.canContinue)
        {
            string text = mainStoryRef.Continue();
            StartCoroutine(DisplayText(text));
        }
        else
        {
            nextLinePromptObj.SetActive(false);
            Button choice = CreateChoiceButton("Continue");
            choice.onClick.AddListener(delegate
            {
                PlayerInventory.pInv.AllowInvShow();
                HideItemInWorld();
                SwitchPlayerMovement();
                ClearCanvasChildren();
            });
        }
    }

    void HideItemInWorld()
    {
        gameObject.SetActive(false);
    }

    public string DescriptionInfo()
    {
        mainStoryRef.ChoosePathString(interactionKnot);
        string desc = mainStoryRef.Continue();
        return desc;
    }
}
