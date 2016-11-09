//
//  Hashing.swift
//  hashingTest
//
//  Created by Christopher Myers on 11/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import Foundation

class HashingLIT {
    
    
    
    init() {
        
    }
    
    func sha256GetLit(string: String) -> Data? {
        guard let messageData = string.data(using: String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        _ = digestData.withUnsafeMutableBytes {digestBytes in messageData.withUnsafeBytes { messageBytes in
            CC_SHA256(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        return digestData
    }
    
    func convertDataToString(result : Data) -> String{
        
        let shaResult = result.map{String(format: "%02hhx", $0) }.joined()
        
        return shaResult
    }

}
