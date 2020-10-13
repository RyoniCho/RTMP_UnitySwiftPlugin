//
//  RTMPUnityWrapper.swift
//  RTMP_Swift
//
//  Created by 조을연 on 2020/10/13.
//

import Foundation
import AVFoundation
import UIKit
import HaishinKit



@objc public class RTMPUnityWrapper: NSObject
{
    static let shared=RTMPUnityWrapper()
    
    @objc public static func GetInstance() -> RTMPUnityWrapper {
           return shared
       }
       
    
    var rtmpConnection=RTMPConnection()
    var rtmpStream:RTMPStream!
    var isStartStream:Bool=false
    
    @objc public func InitializeAVSession()
    {
        let session = AVAudioSession.sharedInstance()
        do {
            // https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
            if #available(iOS 10.0, *) {
                try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            } else {
                session.perform(NSSelectorFromString("setCategory:withOptions:error:"), with: AVAudioSession.Category.playAndRecord, with: [
                    AVAudioSession.CategoryOptions.allowBluetooth,
                    AVAudioSession.CategoryOptions.defaultToSpeaker]
                )
                try session.setMode(.default)
            }
            try session.setActive(true)
        } catch {
            print(error)
        }
    }
    
    @objc public func StartRTMP(view:UIView)
    {
        if(isStartStream==true)
        {
            return
        }
        
        rtmpStream=RTMPStream(connection: rtmpConnection)
        
        rtmpStream.captureSettings=[.fps:30,.sessionPreset:AVCaptureSession.Preset.medium]
        rtmpStream.videoSettings=[.bitrate:5*1200*1024,.maxKeyFrameIntervalDuration:2]
//        rtmpStream.videoSettings=[.bitrate:160*1000,.maxKeyFrameIntervalDuration:2]
//        rtmpStream.attachAudio(AVCaptureDevice.default(for: AVMediaType.audio))
//        {
//            error in
//            print(error)
//        }
        
//        rtmpStream.attachCamera(DeviceUtil.device(withPosition: .back)) { error in
//            print(error)
//        }
        
        rtmpStream.attachScreen(ScreenCaptureSession(viewToCapture: view))
//
//        let hkView = HKView(frame: view.bounds)
//        hkView.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        hkView.attachStream(rtmpStream)
     

        
        // add ViewController#view
        //view.addSubview(hkView)
        print("add ViewController#view")

        rtmpConnection.connect("rtmp://live-sel03.twitch.tv/app/")
        print("rtmp connect")
        rtmpStream.publish("live_561950205_hsmba7LGW90U7Wwm3j0q6oQsVmfbq7")
        print("rtmp publish")
        
        isStartStream=true
        // if you want to record a stream.
        // rtmpStream.publish("streamName", type: .localRecord)
        
    }
    
    @objc public func StopRTMP()
    {
        if(isStartStream==true)
        {
            
            rtmpStream.close()
            rtmpStream.dispose()
            
            rtmpConnection.close()
            
            
            isStartStream=false
        }
        
    }
    
    
}
