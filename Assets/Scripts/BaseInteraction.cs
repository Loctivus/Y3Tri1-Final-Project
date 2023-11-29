using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public class BaseInteraction : MonoBehaviour
{
    public Story mainStoryRef;
    public Canvas canvas;
    public TextMeshProUGUI textPrefab;
    public float displaySpeed = 0.05f;
    [HideInInspector]
    public bool canGoToNextLine;
    public GameObject nextLinePromptObj;
    public Button buttonPrefab;
    public string interactionKnot; //used for going to specific knots in the ink file
    public bool activeRange;
    [HideInInspector]
    public List<string> inkTags = new List<string>();

    void Start()
    {
        mainStoryRef = StoryManager.sMInst.mainStory;
    }

    public virtual void Interaction()
    {
        Debug.Log("Interaction happens");
    }


    public void ClearCanvasChildren()
    {
        int childCount = canvas.transform.childCount;
        for (int i = childCount - 1; i >= 0; i--)
        {
            if (canvas.transform.GetChild(i).gameObject.tag == "Dialogue")
            {
                GameObject.Destroy(canvas.transform.GetChild(i).gameObject);
            }
        }
    }

    public IEnumerator DisplayText(string text)
    {
        TextMeshProUGUI dialogueText = Instantiate(textPrefab);
        dialogueText.text = "";
        canGoToNextLine = false;
        nextLinePromptObj.SetActive(false);

        foreach  (char letter in text.ToCharArray())
        {
            dialogueText.text += letter;
            dialogueText.transform.SetParent(canvas.transform, false);
            dialogueText.transform.SetSiblingIndex(5);
            yield return new WaitForSeconds(displaySpeed);
        }

        canGoToNextLine = true;

        if (mainStoryRef.currentChoices.Count == 0)
        {
            nextLinePromptObj.SetActive(true);
        }
        
        if (mainStoryRef.canContinue == false)
        {
            nextLinePromptObj.SetActive(false);
        }
    }

    public Button CreateChoiceButton(string buttonText)
    {
        Button choice = Instantiate(buttonPrefab);
        choice.transform.SetParent(canvas.transform, false);
        choice.transform.SetSiblingIndex(6);
        TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI>();
        choiceText.text = buttonText;
        HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
        layoutGroup.childForceExpandHeight = false;
        return choice;
    }

    public void SwitchPlayerMovement()
    {
        if (PlayerMove.moveRef.enabled == true)
        {
            PlayerMove.moveRef.anim.SetFloat("Speed_f", 0f);
            PlayerMove.moveRef.enabled = false;
        }
        else if (PlayerMove.moveRef.enabled == false)
        {
            PlayerMove.moveRef.enabled = true;
        }
    }

}
