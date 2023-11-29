using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{
    #region Variables
    public CharacterController charController;
    public float moveSpeed;
    public float runSpeed;
    public float turnSpeed;
    Vector3 velocity;
    bool isGrounded;
    public float gravity = -9.81f;
    public Transform groundDetect;
    public float groundDist = 0.2f;
    public LayerMask groundMask;
    public GameObject playerBody;

    public Animator anim;
    bool notMoving;

    public static PlayerMove moveRef;
    #endregion

    void Awake()
    {
        moveRef = this;
    }

    void Start()
    {
        
        anim = playerBody.GetComponent<Animator>();
    }


    void Update()
    {
        isGrounded = Physics.CheckSphere(groundDetect.position, groundDist, groundMask);

        if (isGrounded && velocity.y < 0)
        {
            velocity.y = -1f;
        }

        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;
        if (Input.GetKey(KeyCode.LeftShift))
        {
            charController.Move(move * runSpeed * Time.deltaTime);
        }
        else
        {
            charController.Move(move * moveSpeed * Time.deltaTime);
        }

        if (playerBody.activeSelf)
        {
            if (x == 0 && z == 0)
            {
                anim.SetFloat("Speed_f", 0f);

                if (!notMoving)
                {
                    notMoving = true;
                    anim.SetInteger("Animation_int", 0);

                }

            }
            else if (Input.GetKey(KeyCode.LeftShift))
            {
                anim.SetFloat("Speed_f", 0.65f);
                notMoving = false;
            }
            else
            {
                anim.SetFloat("Speed_f", 0.3f);
                notMoving = false;
            }
        }

        velocity.y += gravity * Time.deltaTime;
        charController.Move(velocity * Time.deltaTime);

       
        
    }

    void FixedUpdate()
    {
        Vector3 direction = Vector3.zero;
        direction.x = Input.GetAxis("Horizontal");
        direction.z = Input.GetAxis("Vertical");

        if (direction != Vector3.zero)
        {
            playerBody.transform.rotation = Quaternion.Slerp(playerBody.transform.rotation, Quaternion.LookRotation(direction), Time.deltaTime * turnSpeed);
        }
    }
}
