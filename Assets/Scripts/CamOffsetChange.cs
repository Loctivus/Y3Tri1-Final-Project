using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamOffsetChange : MonoBehaviour
{
    public Vector3 newOffset;
    public float newSmoothSpeed;
    

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            Debug.Log("Change camera offset");
            CameraManager.camManRef.ChangeOffset(newOffset, newSmoothSpeed);
            Debug.Log("Camera offset should be changing");
        }
    }
}
