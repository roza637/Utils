//
//  UIViewController+Storyboard.swift
//  Utils
//
//  Created by roza on 2016/09/16.
//  Copyright © 2016年 roza. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String? { get }
    static var bundle: Bundle? { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
    public static var storyboardName: String {
        return String(describing: self)
    }
    
    public static var viewControllerIdentifier: String? {
        return nil
    }
    
    public static var bundle: Bundle? {
        return nil
    }
    
    public static func instantiate() -> Self {
        let loadViewController = { () -> UIViewController? in
            let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
            if let viewControllerIdentifier = viewControllerIdentifier {
                return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
            } else {
                return storyboard.instantiateInitialViewController()
            }
        }
        
        guard let viewController = loadViewController() as? Self else {
            fatalError([
                "Failed to load viewcontroller from storyboard.",
                "storyboard: \(storyboardName), viewControllerID: \(viewControllerIdentifier), bundle: \(bundle)"
                ].joined(separator: " ")
            )
        }
        return viewController
    }
}
