//
//  UIButtonExtension.swift
//  Utils
//
//  Created by roza on 2017/11/02.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

extension UIButton {
    public func onTouchUpInside(_ action: @escaping (UIButton) -> ()) {
        add(event: .touchUpInside, action: action)
    }
    
    public func onTouchDown(_ action: @escaping (UIButton) -> ()) {
        add(event: .touchDown, action: action)
    }
    
    private func add(event: UIControlEvents, action: @escaping (UIButton) -> ()) {
        let holder = ButtonEventHolder(action)
        eventHolder = eventHolder + [holder]
        self.addTarget(holder, action: #selector(ButtonEventHolder.onAction), for: event)
    }
    
    private var eventHolder: [ButtonEventHolder] {
        get {
            return objc_getAssociatedObject(self, &ButtonEventHandlerKey) as? [ButtonEventHolder] ?? []
        }
        
        set {
            objc_setAssociatedObject(self, &ButtonEventHandlerKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}

fileprivate var ButtonEventHandlerKey: String = "ButtonEventHandlerKey"

private class ButtonEventHolder {
    var action: ((UIButton) -> ())?
    init(_ action: @escaping ((UIButton) -> ())) {
        self.action = action
    }
    
    @objc func onAction(sender: UIButton) {
        self.action?(sender)
    }
}
