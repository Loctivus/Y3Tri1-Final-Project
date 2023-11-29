using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CursorControl : MonoBehaviour
{
    public Image interactableImage;
    Vector3 imageScale;
    Vector3 mousePos;
    GameObject playerChar;
    public float detectRange = 3f;
    public float interactRange;
    float imageMinDist = 1f;
    public LayerMask playerMask;
    public Color outOfRangeCol;
    public Color inRangeCol;
    bool inInteractionRange;
    bool inDetectionRange;
    float distFromPlayer;
    BaseInteraction callInteraction;


    void Start()
    {
        playerChar = GameObject.FindGameObjectWithTag("Player");
        callInteraction = gameObject.GetComponent<BaseInteraction>();
        interactableImage.enabled = false;
        Cursor.lockState = CursorLockMode.Confined;
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(transform.position, detectRange);
        Gizmos.DrawWireSphere(transform.position, interactRange);
    }

    void Update()
    {
        mousePos = Input.mousePosition;

        inDetectionRange = Physics.CheckSphere(transform.position, detectRange, playerMask);
        inInteractionRange = Physics.CheckSphere(transform.position, interactRange, playerMask);

        if (inInteractionRange)
        {
            distFromPlayer = Vector3.Distance(transform.position, playerChar.transform.position);
            imageScale.x = distFromPlayer / 1.5f;
            imageScale.y = distFromPlayer / 1.5f;
            interactableImage.transform.localScale = new Vector3(Mathf.Clamp(imageScale.x, 5f, 10f), Mathf.Clamp(imageScale.y, 5f, 10f), 0f);
            
        }
    }

    void OnMouseDown()
    {
        if (inInteractionRange && gameObject.CompareTag("Interaction"))
        {
            Debug.Log("Clicked on item");
            callInteraction = gameObject.GetComponent<BaseInteraction>();
            interactableImage.enabled = false;
            callInteraction.Interaction();
        }
    }

    void OnMouseEnter()
    {
        if (inDetectionRange)
        {
            interactableImage.enabled = true;
            callInteraction.activeRange = true;

        }
        else
        {
            interactableImage.enabled = false;
            callInteraction.activeRange = false;

        }
    }

    void OnMouseOver()
    {
        if (inDetectionRange && interactableImage.enabled == false)
        {
            interactableImage.enabled = true;
        }
        if (inDetectionRange)
        {
            Color imageCol = interactableImage.color;
            interactableImage.transform.position = mousePos;
            imageCol = outOfRangeCol;
            if (inInteractionRange)
            {
                imageCol = inRangeCol;
            }
            imageCol.a = imageMinDist / distFromPlayer + 0.5f;
            interactableImage.color = imageCol;

 
        }
        else
        {
            interactableImage.enabled = false;
            callInteraction.activeRange = false;

        }
    }

    void OnMouseExit()
    {
        interactableImage.enabled = false;
    }
}
