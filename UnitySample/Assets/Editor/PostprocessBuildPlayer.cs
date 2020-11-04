using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;

public static class PostprocessBuildPlayer 
{
    [PostProcessBuild]
    public static void OnPostProcessBuild(BuildTarget buildTarget,string buildPath)
    {
#if UNITY_IOS
        if(buildTarget== BuildTarget.iOS)
        {
            string projectPath = buildPath + "/Unity-iPhone.xcodeproj/project.pbxproj";
            PBXProject pBXProject = new PBXProject();
            pBXProject.ReadFromFile(projectPath);

            
            var unityAppTargetID = pBXProject.GetUnityMainTargetGuid();

            pBXProject.SetBuildProperty(unityAppTargetID, "ALWAYS_EMBEDED_SWIFT_STANDARD_LIBRARIES", "YES");
           
            pBXProject.WriteToFile(projectPath);
        }
#endif
    }
    
}
