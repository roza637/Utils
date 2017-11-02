//
//  NSDecimalNumberExtension.swift
//  Utils
//
//  Created by roza on 2017/01/13.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public func + (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.adding(rhs)
}

public func - (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.subtracting(rhs)
}

public func * (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.multiplying(by: rhs)
}

public func / (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.dividing(by: rhs)
}
