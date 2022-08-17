//
//  Date +.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import Foundation

extension Date {
    
    func toStringOffsetToday() -> String {
        let offsetComps = Calendar.current.dateComponents([.year, .month, .day, .hour], from: self, to: Date())
        
        if let year = offsetComps.year, year > 0 {
            return "\(year)년 전"
        } else if let month = offsetComps.month, month > 0 {
            return "\(month)개월 전"
        } else if let day = offsetComps.day, day > 0 {
            return "\(day)일 전"
        } else {
            return ""
        }
    }
}
