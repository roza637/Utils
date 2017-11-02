//
//  OverlayPresentation.swift
//  Utils
//
//  Created by roza on 2017/08/22.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation
import UIKit

public protocol OverlayPresentation {
    var window: UIWindow?{get set}
    
    func showAnimation()
    var showAnimateDuration: TimeInterval{get}
    
    func hideAnimation()
    var hideAnimateDuration: TimeInterval{get}
    
    func didHideWindow()
}

public extension OverlayPresentation where Self: UIViewController {
    
    private func createWindow() -> UIWindow {
        let frame = UIScreen.main.bounds
        
        let window = TouchThroughWindow(frame: frame)
        window.backgroundColor = UIColor.clear
        window.rootViewController = self
        return window
    }
    
    public func showOverlay(duration: Double) {
        var s = self
        DispatchQueue.main.async {
            s.window = s.createWindow()
            s.window?.makeKeyAndVisible()
            UIView.animate(withDuration: s.showAnimateDuration, animations: {
                s.showAnimation()
            }, completion: { _ in
                DispatchQueue.main.after(delay: duration, execute: {
                    s.hideOverlay()
                })
            })
        }
    }
    
    public func showOverlay() {
        var s = self
        DispatchQueue.main.async {
            s.window = s.createWindow()
            s.window?.makeKeyAndVisible()
            UIView.animate(withDuration: s.showAnimateDuration, animations: {
                s.showAnimation()
            })
        }
    }
    
    public func hideOverlay() {
        var s = self
        DispatchQueue.main.async {
            UIView.animate(withDuration: s.hideAnimateDuration, animations: {
                s.hideAnimation()
            }, completion: { _ in
                if (s.window?.isKeyWindow)! {
                    UIApplication.shared.delegate?.window?.flatMap{ $0.makeKeyAndVisible() }
                }

                s.window = nil
                s.didHideWindow()
            })
        }
    }
    
    public func didHideWindow() {
        // Optional Method
    }
}

