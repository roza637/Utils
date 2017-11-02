//
//  UIButton+TitleDesignable.swift
//  Utils
//
//  Created by roza on 2016/11/15.
//  Copyright © 2016年 roza. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable
    public var numberOfLines: Int {
        get {
            return self.titleLabel!.numberOfLines
        }
        set {
            self.titleLabel?.numberOfLines = newValue
        }
    }
    
    @IBInspectable
    public var minimumFontScale: CGFloat {
        get {
            return self.titleLabel!.minimumScaleFactor
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = true
            self.titleLabel?.minimumScaleFactor = newValue
        }
    }
    
    @IBInspectable
    public var textCentering: Bool {
        get {
            return self.textCentering
        }
        set {
            if newValue {
                self.titleLabel?.textAlignment = .center
            }
        }
    }
}
