//
//  ViewController.swift
//  hashingTest
//
//  Created by Christopher Myers on 11/9/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import Security
import Foundation






class ViewController: UIViewController {
    
    let str = "billgates@email.com"
    let uuid = NSUUID().uuidString
    
    
    let customClassInstance = HashingLIT()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testHashStr = self.str + self.uuid
        
        let result = self.sha256GetLit(string: testHashStr)
        let shaResult = result!.map{String(format: "%02hhx", $0) }.joined()
        
        print(shaResult)
        print(shaResult.characters.count)
        
        let result2 = customClassInstance.sha256GetLit(string: testHashStr)
        
        let resultString = customClassInstance.convertDataToString(result: result2!)
        
        print("This is the 2nd result: \(resultString)")
        
        
        
        print("The result of the hash is: \(result)")
        
        print("Here comes the already available hashvalue method")
        print()
        self.testHash()
        
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
    
    
    
    
    
    func testHash() {
        let strHash = str.hashValue
        let uuidHash = uuid.hashValue
        
        print("Here is the str.hashValue: \(strHash)")
        print("Here is the the uuid.hashValue: \(uuidHash)")
        
        print()
        print()
        print()
        
        
    }
  
 
    
    
    
    
//    func sha256String(data : NSData) -> String {
//        
//        let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH))
//        
//        CC_SHA256(data.bytes, CC_LONG(data.length), UnsafeMutablePointer(res!.mutableBytes))
//        
//        // There is a better way to do this .... but this is a quick hack
//        
//        return "\(res!)".stringByReplacingOccurrencesOfString("", withString: "").stringByReplacingOccurrencesOfString(" ", withString: "")
//        
//    }

    func sha256(data: String) -> Data {
        var hash = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        
        if let newData: Data = data.data(using: .utf8) {
            _ = hash.withUnsafeMutableBytes {mutableBytes in
                newData.withUnsafeBytes {bytes in
                    CC_SHA256(bytes, CC_LONG(newData.count), mutableBytes)
                }
            }
            
            print(newData)
        }
        
        
        return hash
    }


}

