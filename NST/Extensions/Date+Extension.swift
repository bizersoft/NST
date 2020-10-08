//
//  Date+Extension.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import Foundation

extension Date {
    
    var mediumShortString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = .current
        return dateFormatter.string(from: self)
    }
    
    var shortString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
}
