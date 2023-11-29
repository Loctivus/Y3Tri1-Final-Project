using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class Menus : MonoBehaviour
{
    public GameObject pauseMenu;
    public GameObject optionsMenu;
    public GameObject mainMenu;
    public StoryInteraction prologueStarter;
    bool gameStarted;
    AudioSource mainMenuMusic;
    public Slider displaySpeedSlider;

    [SerializeField]
    private StoryInteraction[] sIObjs;
    [SerializeField]
    private TextMeshProUGUI[] tmpObjs;
    [SerializeField]
    private ItemInteraction[] iIObjs;


    public GameObject dialoguePrefab;
    public GameObject buttonPrefab;

    void Awake()
    {
        sIObjs = FindObjectsOfType<StoryInteraction>(true);
        iIObjs = FindObjectsOfType<ItemInteraction>(true);
        tmpObjs = FindObjectsOfType<TextMeshProUGUI>(true);
    }

    void Start()
    {
        mainMenuMusic = GetComponent<AudioSource>();

    }

    void Update()
    {
        if ((Input.GetKeyDown(KeyCode.Escape) || Input.GetKeyDown(KeyCode.P)) && !pauseMenu.activeSelf && gameStarted)
        {
            Time.timeScale = 0f;
            pauseMenu.SetActive(true);
            optionsMenu.SetActive(false);
            SoundManager.sMInst.ToggleSounds(false);
        }
    }

    public void RestartGame()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        StoryManager.sMInst.ResetStory();
    }

    public void ActivateStart()
    {
        mainMenu.SetActive(false);
        prologueStarter.activeRange = true;
        gameStarted = true;

        StartCoroutine(StartGame());

    }

    public IEnumerator StartGame()
    {
        while (mainMenuMusic.volume != 0)
        {
            mainMenuMusic.volume -= 0.01f;
            yield return new WaitForSeconds(0.05f);
        }
        mainMenuMusic.Stop();
        SoundManager.sMInst.prologueSoundsObj.SetActive(true);
        prologueStarter.Interaction();

    }

    public void QuitGame()
    {
        Application.Quit();
    }

    public void Resume()
    {
        Time.timeScale = 1f;
        pauseMenu.SetActive(false);
        SoundManager.sMInst.ToggleSounds(true);
    }

    public void Back()
    {
        optionsMenu.SetActive(false);
        if (gameStarted)
        {
            pauseMenu.SetActive(true);
        }
        else
        {
            mainMenu.SetActive(true);
        }
    }

    public void ShowOptions()
    {
        mainMenu.SetActive(false);
        pauseMenu.SetActive(false);
        optionsMenu.SetActive(true);
    }

    public void SetTypeSpeed()
    {
        foreach (StoryInteraction sIObj in sIObjs)
        {
            sIObj.displaySpeed = (displaySpeedSlider.value / 100f);
        }

        foreach (ItemInteraction iIObj in iIObjs)
        {
            iIObj.displaySpeed = (displaySpeedSlider.value / 100f);
        }
    }
    
    public void SetFont(TMP_FontAsset newFont)
    {
        foreach (TextMeshProUGUI tmpObj in tmpObjs)
        {
            if (tmpObj.tag != "IgnoreFontChange")
            tmpObj.font = newFont;
        }

        dialoguePrefab.GetComponent<TextMeshProUGUI>().font = newFont;
        buttonPrefab.GetComponentInChildren<TextMeshProUGUI>().font = newFont;
    }
}
