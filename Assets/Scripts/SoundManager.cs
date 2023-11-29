using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour
{
    public static SoundManager sMInst;
    public GameObject[] allSoundObjs;
    public GameObject beachSoundsObj;
    public GameObject prologueSoundsObj;

    
    void Start()
    {
        sMInst = this;   
    }

    
    public void TurnDownPrologueSFX()
    {
        AudioSource[] sounds = prologueSoundsObj.GetComponents<AudioSource>();

        foreach  (AudioSource sound in sounds)
        {
            sound.Stop();
        }

        beachSoundsObj.SetActive(true);
    }

    public void ToggleSounds(bool soundsOn)
    {
        foreach (GameObject soundObj in allSoundObjs)
        {
            if (soundObj.activeSelf)
            {
                AudioSource[] soundComps = soundObj.GetComponents<AudioSource>();
                foreach (AudioSource soundComp in soundComps)
                {
                    if (soundsOn)
                    {
                        soundComp.UnPause();
                    }
                    else
                    {
                        soundComp.Pause();
                    }
                }
            }
        }
    }
}
