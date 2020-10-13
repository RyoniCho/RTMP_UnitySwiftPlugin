using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class RTMPUnityImpl : MonoBehaviour {

    [DllImport("__Internal")]
    internal static extern void InitializeAVSession();

    [DllImport("__Internal")]
    internal static extern void StartRTMP();

    [DllImport("__Internal")]
    internal static extern void StopRTMP();



    void OnGUI()
    {
        if (GUI.Button(new Rect(0, 0, 100, 100), "START"))
        {
            StartRTMP();
        }

        if (GUI.Button(new Rect(0, 200, 100, 100), "STOP"))
        {
            StopRTMP();
        }
        if (GUI.Button(new Rect(0, 400, 100, 100), "init"))
        {
            InitializeAVSession();
        }


    }
}
