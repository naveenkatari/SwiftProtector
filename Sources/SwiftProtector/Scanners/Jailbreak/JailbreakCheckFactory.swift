//
//  File.swift
//  
//
//  Created by Naveen.Katari on 03/11/24.
//

import Foundation

/// Factory that dynamically generates and returns an array of selected jailbreak checks based on provided options.
struct JailbreakCheckFactory {
    /// Generates an array of selected checks based on the provided options.
    /// - Parameters:
    ///   - includeFileCheck: If `true`, includes the file presence check.
    ///   - includeSystemWriteCheck: If `true`, includes the system write check.
    ///   - includeProcessCheck: If `true`, includes the process check.
    ///   - includeSymbolicLinkCheck: If `true`, includes the symbolic link check.
    /// - Returns: An array of active `JailbreakCheck` instances based on the provided options.
    static func createChecks(includeFileCheck: Bool = true,
                             includeSystemWriteCheck: Bool = true,
                             includeProcessCheck: Bool = true,
                             includeSymbolicLinkCheck: Bool = true) -> [JailbreakCheck] {
        
        var checks: [JailbreakCheck] = []
        
        if includeFileCheck {
            checks.append(JailbreakFilePresenceCheck())
        }
        if includeSystemWriteCheck {
            checks.append(JailbreakWriteAccessCheck())
        }
        if includeProcessCheck {
            checks.append(JailbreakProcessCheck())
        }
        if includeSymbolicLinkCheck {
            checks.append(JailbreakSymbolicLinkCheck())
        }
        
        return checks
    }
}
