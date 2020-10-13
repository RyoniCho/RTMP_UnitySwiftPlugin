//
//  RTMPUnityPluginBridge.m
//  RTMP_UnityBridge
//
//  Created by 조을연 on 2020/10/13.
//

#import <Foundation/Foundation.h>
#import "RTMP_UnityBridge.h"

#import <RTMP_Swift/RTMP_Swift.h>
#include "UI/UnityView.h"'
#include "UnityAppController.h"

extern "C"
{
    
    void InitializeAVSession()
    {
        
        [[RTMPUnityWrapper GetInstance] InitializeAVSession];
    }

    void StartRTMP()
    {
        UIView* view = GetAppController().unityView;
        
        [[RTMPUnityWrapper GetInstance] StartRTMPWithView:view];
    }

    void StopRTMP()
    {
        [[RTMPUnityWrapper GetInstance] StopRTMP];
    }
}
