//
//  StringExtenstion.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation


extension String {
    
    // MARK: Convert Date From Format To Nother Format
    func convertDate(fromDateFormat: String, toDateFormat: String) -> String? {
        
        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromDateFormat
        
        if let fromDateObject = fromDateFormatter.date(from: self) {
            
            let toDateFormatter = DateFormatter()
            toDateFormatter.dateFormat = toDateFormat
            
            let newDateString = toDateFormatter.string(from: fromDateObject)
            return newDateString
        }
        
        return nil
    }
    
}
