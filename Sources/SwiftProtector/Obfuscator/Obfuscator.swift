//
//  File.swift
//  
//
//  Created by Naveen.Katari on 21/10/24.
//

import Foundation

public class Obfuscator: ObfuscationProtocol {
    
    private let letters: String

    public init(characterSet: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") {
        self.letters = characterSet
    }

    public func obfuscate(code: String) -> String {
        let pattern = "\\b([a-zA-Z_][a-zA-Z0-9_]*)\\b"
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(code.startIndex..., in: code)
            var obfuscatedCode = code

            regex.enumerateMatches(in: code, options: [], range: range) { match, _, _ in
                if let matchRange = match?.range(at: 1), let rangeInString = Range(matchRange, in: code) {
                    let variableName = String(code[rangeInString])
                    
                    let obfuscatedName = self.randomString(length: 8)
                    
                    obfuscatedCode = obfuscatedCode.replacingOccurrences(of: variableName, with: obfuscatedName)
                }
            }
            
            return obfuscatedCode
        } catch {
            print("Regex error: \(error)")
            return code
        }
    }

    private func randomString(length: Int) -> String {
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}

