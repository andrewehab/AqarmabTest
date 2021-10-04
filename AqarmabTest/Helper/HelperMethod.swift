//
//  HelperMethod.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation

class HelperMethod {
    
    //MARK: - Value For Plist Key
    static func valueForPlistKey(plistName: String, named keyName:String) -> String {
        guard let filePath = Bundle.main.path(forResource: plistName, ofType: "plist") ,let plist = NSDictionary(contentsOfFile:filePath), let value = plist.object(forKey: keyName) as? String else {
            return ""
        }
        return value
    }
    
}
