//
//  TouchThroughWindow.swift
//  Utils
//
//  Created by roza on 2017/08/22.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation
import UIKit

public class TouchThroughWindow: UIWindow {
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return nil
        }
        return view
    }
}
