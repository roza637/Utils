//
//  DispatchQueueExtension.swift
//  Utils
//
//  Created by roza on 2017/10/30.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    public func after(delay: Double, execute: @escaping () -> Void) {
        self.asyncAfter(deadline: .now() + delay, execute: execute)
    }
}
