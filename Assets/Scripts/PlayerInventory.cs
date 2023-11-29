using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerInventory : MonoBehaviour
{
    #region Variables
    public List<ItemInteraction> items = new List<ItemInteraction>();
    public static PlayerInventory pInv;
    public GameObject invPanel;
    public TextMeshProUGUI itemName;
    public TextMeshProUGUI itemDescription;
    public bool canOpenInv;
    int invNum = 0;
    #endregion


    void Start()
    {
        pInv = this;
        //invPanel.SetActive(false);
    }

    void Update()
    {
        if (canOpenInv)
        {
            if (Input.GetKeyDown(KeyCode.I) && invPanel.activeSelf == false)
            {
                invPanel.SetActive(true);
                if (items.Count == 0)
                {
                    itemName.text = "Your inventory is empty.";
                    itemDescription = null;
                }
                else
                {
                    ShowInventory(invNum);
                }
                

            }
            else if (Input.GetKeyDown(KeyCode.I) && invPanel.activeSelf == true)
            {
                invPanel.SetActive(false);
            }
        }
    }

    public void AllowInvShow()
    {
        canOpenInv = true;
    }

    void ShowInventory(int inventoryNum)
    {
        Debug.Log(items.Count);
        if (items == null)
        {
            itemName.text = "Your inventory is empty.";
            itemDescription.text = "";
        }
        else
        {
            itemName.text = items[inventoryNum].itemName;
            string itemDesc = items[inventoryNum].DescriptionInfo();
            itemDescription.text = itemDesc;
            
        }
    }



    public void NextItem()
    {
        if (invNum < items.Count)
        {
            invNum++;
        }
        else
        {
            Debug.Log("There are no more items in inventory");

        }
        Debug.Log(invNum);
        ShowInventory(invNum);
    }

    public void PreviousItem()
    {
        if (invNum != 0)
        {
            invNum--;
        }
        Debug.Log(invNum);
        ShowInventory(invNum);

    }
}
