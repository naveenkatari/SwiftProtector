//
//  File.swift
//  
//
//  Created by Naveen.Katari on 29/10/24.
//

import Foundation

/// Checks for modified symbolic links, which are often modified on jailbroken devices to bypass system protections.
struct JailbreakSymbolicLinkCheck: JailbreakCheck {
    func isJailbroken() -> Bool {
        let symbolicLinks = ["/Applications", "/Library/Ringtones"]
        
        for link in symbolicLinks {
            if let attributes = try? FileManager.default.attributesOfItem(atPath: link),
               attributes[.type] as? FileAttributeType == .typeSymbolicLink {
                print("Modified symbolic link found: \(link)")
                return true
            }
        }
        return false
    }
}
