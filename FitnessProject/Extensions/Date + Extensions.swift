//
//  Date + Extensions.swift
//  FitnessProject
//
//  Created by Fedor on 17.04.2022.
//

import Foundation

extension Date {
    
    // returns
    func localDate() -> Date {
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: self) ?? Date()
        return localDate
    }
    
    // returns two-dimensional array of numbers of days and weekdays
    func getWeekArray() -> [[String]] {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "EEEEEE"
        
        var weekArray: [[String]] = [[], []]
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            let weekday = formatter.string(from: date)
            
            print(date)
            print(day)
            print(weekday)
            
            weekArray[0].append(weekday)
            weekArray[1].append("\(day)")
        }
        return weekArray
    }
    
    // returns the number of weekday
    func numberOfWeekday() -> Int {
        
        // creating calendar depends on current day
        let calendar = Calendar.current
        
        // creating number of weekday
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
