//
//  File.swift
//  
//
//  Created by Naveen.Katari on 29/10/24.
//

import Foundation

/// Attempts to write to a protected system directory, which should be restricted on non-jailbroken devices.
struct JailbreakWriteAccessCheck: JailbreakCheck {
    func isJailbroken() -> Bool {
        let testPath = "/private/jailbreakTest.txt"
        
        do {
            // Attempt to write to a restricted directory
            try "Jailbreak Test".write(toFile: testPath, atomically: true, encoding: .utf8)
            try FileManager.default.removeItem(atPath: testPath)
            print("Can write to system directory.")
            return true
        } catch {
            return false
        }
    }
}
