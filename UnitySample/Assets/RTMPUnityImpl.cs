using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

public class RTMPUnityImpl : MonoBehaviour {

#if UNITY_IOS

    [DllImport("__Internal")]
    internal static extern void InitializeAVSession();

    [DllImport("__Internal")]
    internal static extern void StartRTMP(string url,string key);

    [DllImport("__Internal")]
    internal static extern void StopRTMP();

    //Rtmp URL: ex) rtmp://live-sel03.twitch.tv/app/
    string rtmpUrl = "==TWITCH RTMP URL HERE==";

    //Stream_key: ex)live_user_123456789
    string rtmpKey = "==TWITCH RTMP KEY HERE=="; 


    void OnGUI()
    {
        if (GUI.Button(new Rect(0, 0, 100, 100), "START"))
        {
            StartRTMP(rtmpUrl,rtmpKey);
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
#endif
}
