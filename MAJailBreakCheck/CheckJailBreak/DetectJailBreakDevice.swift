//
//  CheckForJailBreak.swift
//
//  Created by P Gowthamraj (MA-IN) on 12/09/24.
//

import Foundation
import UIKit


let fm = FileManager.default

private var isSimulator: Bool {
    return TARGET_OS_SIMULATOR != 0
}

class CheckForJailBreak {

    func checkForJailbrokenDevice() -> Bool {
        if !isSimulator{
            // Check if Cydia app is installed on the device
            guard let cydiaURL = URL(string: "cydia://"),
                  UIApplication.shared.canOpenURL(cydiaURL) else {
                return  canEditSandboxFilesForJailBreakDetection() || systemForkCall() || FridaDetection().isFridaDetected || isJailBrokenFilesPresentInTheDirectory()
            }
            return true
        }else{
            return false
        }
    }
    
    
///   Tries to write into system files
///   If success then device is jail broken
    func canEditSandboxFilesForJailBreakDetection() -> Bool {
        let jailBreakTestText = "Test for JailBreak"
        do {
            try jailBreakTestText.write(toFile:"\(jailBreakTestText).txt",
                                        atomically:true,
                                        encoding:String.Encoding.utf8)
            return true
        } catch {
            return false
        }
    }
    
    /// Checks from the array 'filesPathToCheck' that particular file or app are installed on the device
    /// If file exists then device is jail broken
    func isJailBrokenFilesPresentInTheDirectory() -> Bool{
        var checkFileIfExist: Bool = false
        FilesPathToCheck().filesPathToCheck.forEach {
            checkFileIfExist =  fm.fileExists(atPath: $0) ? true : false
            if checkFileIfExist {
                return
            }
        }
        return checkFileIfExist
    }
    
    /// Check if there is a child process run at kernel level
    func systemForkCall() -> Bool{
        
        let pid = getpgrp()
        
        if pid < 0
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    
}
