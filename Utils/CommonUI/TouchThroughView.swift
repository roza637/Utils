//
//  TouchThroughView.swift
//  Utils
//
//  Created by roza on 2016/11/17.
//  Copyright © 2016年 roza. All rights reserved.
//

import UIKit

public class TouchThroughView : UIView {
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return nil
        }
        return view
    }
}
