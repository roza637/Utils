//
//  UIViewExtension.swift
//  Utils
//
//  Created by roza on 2016/08/02.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    public func addSubviews(subviews: [UIView]) {
        subviews.forEach{self.addSubview($0)}
    }
    
    public func addSubviews(subviews: UIView...) {
        self.addSubviews(subviews: subviews)
    }
    
    public func removeAllSubviews() {
        self.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    public func setCornerRadius(radius: CGFloat, corner: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corner,
                                    cornerRadii: CGSize.init(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    public func addChildConstraints(for childView: UIView, insets: UIEdgeInsets = .zero) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: childView.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: insets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: insets.right).isActive = true
    }
    
}
