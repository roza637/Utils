//
//  DictionaryExtension.swift
//  Utils
//
//  Created by roza on 2017/11/01.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public func +<K, V>(lhs: [K : V], rhs: [K : V]) -> [K : V] {
    var lhs = lhs
    
    rhs.forEach{
        lhs[$0.key] = $0.value
    }
    
    return lhs
}
