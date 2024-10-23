//
//  File.swift
//  
//
//  Created by Naveen.Katari on 23/10/24.
//

import Foundation

public protocol TamperDetectionProtocol {
    func isDebuggerAttached() -> Bool
    func terminateIfDebugger()
}
