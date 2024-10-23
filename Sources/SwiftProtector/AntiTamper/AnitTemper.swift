//
//  File.swift
//  
//
//  Created by Naveen.Katari on 23/10/24.
//

import Foundation

public class AntiTamper: TamperDetectionProtocol {

    public init() {}

    public func isDebuggerAttached() -> Bool {
        var name: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var info = kinfo_proc()
        var infoSize = MemoryLayout.size(ofValue: info)
        let success = name.withUnsafeMutableBytes { (namePtr: UnsafeMutableRawBufferPointer) -> Bool in
            guard let baseAddress = namePtr.baseAddress else { return false }
            return sysctl(baseAddress.assumingMemoryBound(to: Int32.self), 4, &info, &infoSize, nil, 0) == 0
        }

        return success ? (info.kp_proc.p_flag & P_TRACED != 0) : false
    }

    public func terminateIfDebugger() {
        if isDebuggerAttached() {
            exit(1)
        }
    }
}

