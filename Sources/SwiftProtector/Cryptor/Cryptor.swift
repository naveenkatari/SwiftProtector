//
//  File.swift
//  
//
//  Created by Naveen.Katari on 23/10/24.
//

import Foundation
import CryptoKit

public class CryptoHelper: EncryptionProtocol {

    public init() {}

    // AES Encryption using CryptoKit
    public func encrypt(_ plaintext: String, key: SymmetricKey) -> String? {
        guard let data = plaintext.data(using: .utf8) else { return nil }

        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined?.base64EncodedString()
        } catch {
            print("Encryption failed: \(error)")
            return nil
        }
    }

    public func decrypt(_ encryptedText: String, key: SymmetricKey) -> String? {
        guard let combinedData = Data(base64Encoded: encryptedText) else { return nil }

        do {
            let sealedBox = try AES.GCM.SealedBox(combined: combinedData)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Decryption failed: \(error)")
            return nil
        }
    }

    // Generate a random symmetric key
    public func generateKey() -> SymmetricKey {
        return SymmetricKey(size: .bits256)
    }
}
