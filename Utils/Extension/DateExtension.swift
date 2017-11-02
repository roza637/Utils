//
//  DateExtension.swift
//  Utils
//
//  Created by roza on 2016/10/04.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation

public extension String {
    
    public func date(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.date(from: self)
    }
    
}

public extension Date {
    
    //時間部分を除いた日付のみで同値比較する
    public func isSameDate(date: Date) -> Bool {
        return self.string(format: "yyyyMMdd") == date.string(format: "yyyyMMdd")
    }

    //時間部分を除いた日付のみのDateを返却する
    public var date: Date {
        //HACK: 他に方法があれば変更したほうがよさそう
        return self.string(format: "yyyyMMdd").date(format: "yyyyMMdd")!
    }
    
    //当月一日取得
    public var firstDayOfMonth: Date {
        return self.setDay(1)
    }
    
    //当月末日取得
    public var lastDayOfMonth: Date {
        return self.firstDayOfMonth.addMonth(1).addDay(-1)
    }

    public func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: self)
    }
    
    public func addHour(_ hour: Int) -> Date {
        return self.add(component: .hour, value: hour)
    }
    
    public func addDay(_ day: Int) -> Date {
        return self.add(component: .day, value: day)
    }
    
    public func addMonth(_ month: Int) -> Date {
        return self.add(component: .month, value: month)
    }
    
    public func addYear(_ year: Int) -> Date {
        return self.add(component: .year, value: year)
    }
    
    public func add(component: Calendar.Component, value: Int) -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        return calendar.date(byAdding: component, value: value, to: self)!
    }
    
    public func setDay(_ day: Int) -> Date {
        return self.set(component: .day, value: day)
    }
    
    public func set(component: Calendar.Component, value: Int) -> Date {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: self)
        components.setValue(value, for: component)
        return calendar.date(from: components)!
    }
    
    public func enumeration(days: Int) -> [Date] {
        return (0 ..< days).map{ self.addDay($0) }
    }
}
