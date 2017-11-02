//
//  CGRectExtension.swift
//  Utils
//
//  Created by roza on 2016/08/02.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation
import UIKit

public extension CGRect {
    
    // Properties
    public var x: CGFloat {
        return self.origin.x
    }
    
    public var y: CGFloat {
        return self.origin.y
    }
    
    public var right: CGFloat {
        return self.maxX
    }
    
    public var bottom: CGFloat {
        return self.maxY
    }
    
    public var centerX: CGFloat {
        return self.x + self.width / 2
    }
    
    public var centerY: CGFloat {
        return self.y + self.height / 2
    }
    
    public var center: CGPoint {
        return CGPoint(x: self.centerX, y: self.centerY)
    }
    
    
    // SetX
    public func setX(_ x: CGFloat) -> CGRect {
        return CGRect(x: x, y: self.origin.y, width: self.width, height: self.height)
    }
    
    public func setX(_ x: Double) -> CGRect {
        return self.setX(CGFloat(x))
    }
    
    public func setX(_ x: Int) -> CGRect {
        return self.setX(CGFloat(x))
    }
    
    
    // SetY
    public func setY(_ y: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: y, width: self.width, height: self.height)
    }
    
    public func setY(_ y: Double) -> CGRect {
        return self.setY(CGFloat(y))
    }
    
    public func setY(_ y: Int) -> CGRect {
        return self.setY(CGFloat(y))
    }
    
    // SetWidth
    public func setWidth(_ width: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: self.origin.y, width: width, height: self.height)
    }
    
    public func setWidth(_ width: Double) -> CGRect {
        return self.setWidth(CGFloat(width))
    }

    public func setWidth(_ width: Int) -> CGRect {
        return self.setWidth(CGFloat(width))
    }
    
    //SetHeight
    public func setHeight(_ height: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: self.origin.y, width: self.width, height: height)
    }
    
    public func setHeight(_ height: Double) -> CGRect {
        return self.setHeight(CGFloat(height))
    }
    
    public func setHeight(_ height: Int) -> CGRect {
        return self.setHeight(CGFloat(height))
    }

    
    //SetCenter
    public func setCenterX(_ x: CGFloat) -> CGRect {
        return self.addX(x - self.centerX)
    }
    
    public func setCenterX(_ x: Double) -> CGRect {
        return self.setCenterX(CGFloat(x))
    }
    
    public func setCenterY(_ y: CGFloat) -> CGRect {
        return self.addY(y - self.centerY)
    }
    
    public func setCenterY(_ y: Double) -> CGRect {
        return self.setCenterY(CGFloat(y))
    }
    
    public func setCenter(_ center: CGPoint) -> CGRect {
        return self.setCenterX(center.x).setCenterY(center.y)
    }

    
    //SetBottom
    public func setBottom(_ y:CGFloat) -> CGRect {
        return self.addY(y - self.bottom)
    }
    
    public func setBottom(_ y: Double) -> CGRect {
        return self.setBottom(CGFloat(y))
    }
    
    
    // Add
    public func addX(_ e: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x + e, y: self.origin.y, width: self.width, height: self.height)
    }
    
    public func addX(_ e: Double) -> CGRect {
        return self.addX(CGFloat(e))
    }
    
    public func addX(_ e: Int) -> CGRect {
        return self.addX(CGFloat(e))
    }
    
    public func addY(_ e: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: self.origin.y + e, width: self.width, height: self.height)
    }

    public func addY(_ e: Double) -> CGRect {
        return self.addY(CGFloat(e))
    }
    
    public func addY(_ e: Int) -> CGRect {
        return self.addY(CGFloat(e))
    }
    
    public func addWidth(_ e: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: self.origin.y, width: self.width + e, height: self.height)
    }
    
    public func addWidth(_ e: Double) -> CGRect {
        return self.addWidth(CGFloat(e))
    }
    
    public func addWidth(_ e: Int) -> CGRect {
        return self.addWidth(CGFloat(e))
    }

    public func addHeight(_ e: CGFloat) -> CGRect {
        return CGRect(x: self.origin.x, y: self.origin.y, width: self.width, height: self.height + e)
    }
    
    public func addHeight(_ e: Double) -> CGRect {
        return self.addHeight(CGFloat(e))
    }
    
    public func addHeight(_ e: Int) -> CGRect {
        return self.addHeight(CGFloat(e))
    }
    
}
