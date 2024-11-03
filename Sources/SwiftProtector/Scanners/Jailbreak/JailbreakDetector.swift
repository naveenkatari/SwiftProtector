//
//  File.swift
//  
//
//  Created by Naveen.Katari on 03/11/24.
//

import Foundation
/// JailbreakDetector that performs a specified set of jailbreak checks.
struct JailbreakDetector {
    /// Array of jailbreak checks to perform, customizable via dependency injection.
    private let checks: [JailbreakCheck]

    /// Initializes `JailbreakDetector` with an array of custom checks.
    /// - Parameter checks: Array of `JailbreakCheck` instances to perform; defaults to factory-generated checks.
    init(checks: [JailbreakCheck] = JailbreakCheckFactory.createChecks()) {
        self.checks = checks
    }

    /// Runs all jailbreak detection checks provided during initialization.
    /// - Returns: `true` if any check detects a jailbreak, otherwise `false`.
    func isJailbroken() -> Bool {
        for check in checks {
            if check.isJailbroken() {
                return true
            }
        }
        return false
    }
}
