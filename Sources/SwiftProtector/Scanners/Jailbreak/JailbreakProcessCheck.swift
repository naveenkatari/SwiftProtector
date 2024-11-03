//
//  File.swift
//  
//
//  Created by Naveen.Katari on 29/10/24.
//

import Foundation

/// Checks for indirect evidence of suspicious processes associated with jailbreak tools on iOS.
struct JailbreakProcessCheck: JailbreakCheck {
    func isJailbroken() -> Bool {
        /// List of known file paths associated with popular jailbreak tools and apps.
        /// These paths represent applications or files that are typically only found on jailbroken devices.
        /// While this list can be updated over time, these paths cover many commonly used jailbreaks
        let suspiciousPaths = [
            "/Applications/blackra1n.app",
            "/Applications/Cydia.app",
            "/Applications/FakeCarrier.app",
            "/Applications/Icy.app",
            "/Applications/IntelliScreen.app",
            "/Applications/MxTube.app",
            "/Applications/RockApp.app",
            "/Applications/SBSettings.app",
            "/Applications/WinterBoard.app",
            "/Applications/evasi0n7.app",
            "/Applications/limera1n.app"
        ]
        
        for path in suspiciousPaths {
            if FileManager.default.fileExists(atPath: path) {
                print("Suspicious app or process found at path: \(path)")
                return true
            }
        }
        return false
    }
}

