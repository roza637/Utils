//
//  Dictionary+JsonString.swift
//  Utils
//
//  Created by roza on 2016/12/20.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation

public extension Dictionary {
    public var jsonString: String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)!
        } catch {
            return ""
        }
    }
}
