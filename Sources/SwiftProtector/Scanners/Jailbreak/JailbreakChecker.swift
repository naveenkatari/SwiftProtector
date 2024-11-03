//
//  File.swift
//  
//
//  Created by Naveen.Katari on 29/10/24.
//

import Foundation

/// Protocol defining a common interface for jailbreak detection checks.
protocol JailbreakCheck {
    /// Executes a jailbreak check and returns whether the check was positive for jailbreak.
    func isJailbroken() -> Bool
}
