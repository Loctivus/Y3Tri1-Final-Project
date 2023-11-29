using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraManager : MonoBehaviour
{
    public static CameraManager camManRef;
    public Transform target;

    public float smoothMove;
    public Vector3 offset;
    public float transitionSpeed;

    private void Start()
    {
        camManRef = this;
    }

    void LateUpdate()
    {
        Vector3 exactPos = target.position + offset;
        Vector3 smoothPos = Vector3.Lerp(transform.position, exactPos, smoothMove * Time.deltaTime);
        transform.position = smoothPos;
        transform.LookAt(target);
    }

    public void ChangeOffset(Vector3 newOffset, float newSmoothMove)
    {
        StartCoroutine(GradualOffset(newOffset, newSmoothMove));

    }

    public IEnumerator GradualOffset(Vector3 newOffset, float newSmoothMove)
    {
        while (offset != newOffset)
        {
            offset = Vector3.Lerp(offset, newOffset, transitionSpeed);
            smoothMove = Mathf.Lerp(smoothMove, newSmoothMove, transitionSpeed);
            yield return null;
        }
    }

}
