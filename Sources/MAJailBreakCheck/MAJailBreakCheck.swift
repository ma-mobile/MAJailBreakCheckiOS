//
//  MAJailBreakCheck.swift
//  MAJailBreakCheck
//
//  Created by Harikrishnan V S (MA-IN) on 24/09/24.
//

import Foundation
public class MAJailBreakCheck{
    ///Checks if device is jail broken. Returns true if jailbroken , false if not.
    public static func checkIfJailBroken() -> Bool{
        return CheckForJailBreak().checkForJailbrokenDevice()
    }
}
