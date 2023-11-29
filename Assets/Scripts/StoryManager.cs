using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class StoryManager : MonoBehaviour
{
    public static StoryManager sMInst;
    public TextAsset inkStoryJSON;
    public Story mainStory;
    
    void Awake()
    {
        sMInst = this;
        mainStory = new Story(inkStoryJSON.text);
    }

    public void ResetStory()
    {
        mainStory = new Story(inkStoryJSON.text);
    }
}
