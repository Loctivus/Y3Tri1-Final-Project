using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CompanionMovement : MonoBehaviour
{
    public static CompanionMovement comMoveRef;
    public Transform targetLoc;
    public GameObject charModel;
    [SerializeField]
    float minDist = 5f;
    [SerializeField]
    float moveSpeed;
    Animator companAnim;
    [HideInInspector]
    public bool companionAlive;

    void Awake()
    {
        comMoveRef = this;
        companAnim = gameObject.GetComponentInChildren<Animator>();    
    }

    void OnEnable()
    {
        companionAlive = true;
    }

    void Update()
    {
        transform.LookAt(targetLoc);

        float distance = Vector3.Distance(transform.position, targetLoc.position);

        if (distance > minDist)
        {
            companAnim.SetFloat("Speed_f", 0.3f);
            transform.position = Vector3.Lerp(transform.position, targetLoc.position, moveSpeed);
        }
        else
        {
            companAnim.SetFloat("Speed_f", 0f);
            companAnim.SetInteger("Animation_int", 0);
        }
    }
}
