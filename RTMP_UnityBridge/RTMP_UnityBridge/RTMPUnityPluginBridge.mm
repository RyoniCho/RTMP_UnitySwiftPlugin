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

    void StartRTMP(const char* rtmpUrl,const char* rtmpPublishKey)
    {
        UIView* view = GetAppController().unityView;
        NSString* url=[NSString stringWithUTF8String:rtmpUrl];
        NSString* key=[NSString stringWithUTF8String:rtmpPublishKey];
        
        [[RTMPUnityWrapper GetInstance] StartRTMPWithView:view rtmpUrl:url publishKey:key];
    }

    void StopRTMP()
    {
        [[RTMPUnityWrapper GetInstance] StopRTMP];
    }
}
