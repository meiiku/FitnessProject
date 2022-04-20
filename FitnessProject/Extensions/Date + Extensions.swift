//
//  Date + Extensions.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import Foundation

extension Date {
    
    func numberOfWeekday() -> Int {
        
        // creating calendar depends on current day
        let calendar = Calendar.current
        
        // creating number of weekday
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
