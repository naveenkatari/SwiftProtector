//
//  File.swift
//  
//
//  Created by Naveen.Katari on 23/10/24.
//

import Foundation
import CryptoKit

public protocol EncryptionProtocol {
    func encrypt(_ plaintext: String, key: SymmetricKey) -> String?
    func decrypt(_ encryptedText: String, key: SymmetricKey) -> String?
    func generateKey() -> SymmetricKey
}
