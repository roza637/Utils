//
//  PickerViewController.swift
//  Utils
//
//  Created by roza on 2016/09/28.
//  Copyright © 2016年 roza. All rights reserved.
//

import UIKit

public class PickerViewController : UIViewController, StoryboardInstantiatable, OverlayPresentation {
    
    public static var bundle: Bundle? {
        return Bundle(for: PickerViewController.self)
    }
    
    public var showAnimateDuration: TimeInterval = 0.2
    public var hideAnimateDuration: TimeInterval = 0.2
    public func showAnimation() {
        self.backgroundView!.alpha = 0.6
        self.pickerBackY!.constant = 0
        self.view.layoutIfNeeded()
    }
    
    public func hideAnimation() {
        self.backgroundView!.alpha = 0
        self.pickerBackY!.constant = -220
        self.view.layoutIfNeeded()
    }
    
    public func didHideWindow() {
        if self.selectedIndex >= 0 {
            self.items[self.selectedIndex].onSelected?()
        }
        self.completion?()
        self.completion = nil
    }
    
    public static func showPicker(items:[PickerItemViewModel], selectedIndex: Int = 0) {
        let picker = PickerViewController.instantiate()
        picker.items = items
        picker.selectedIndex = selectedIndex
        picker.showOverlay()
    }
    
    fileprivate var items: [PickerItemViewModel] = []
    fileprivate var selectedIndex : Int = 0
    
    @IBOutlet private weak var pickerView :UIPickerView?
    @IBOutlet private weak var backgroundView :UIView?
    @IBOutlet private weak var pickerBackY :NSLayoutConstraint?
    
    var completion :(() -> ())?
    
    override public var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return UIModalPresentationStyle.overCurrentContext
        }
        set {
            super.modalPresentationStyle = newValue
        }
    }
    
    @IBAction private func complete() {
        self.hideOverlay()
    }
    
    @IBAction private func cancel() {
        self.completion = nil
        selectedIndex = -1
        self.hideOverlay()
    }
}

extension PickerViewController : UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension PickerViewController : UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row].title
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
}

public class PickerItemViewModel {
    public let title: String
    public let onSelected: (() -> ())?
    
    public init(title: String, onSelected: (() -> ())? = nil) {
        self.title = title
        self.onSelected = onSelected
    }
}
