//
//  PickerViewController.swift
//  Utils
//
//  Created by roza on 2016/09/28.
//  Copyright © 2016年 roza. All rights reserved.
//

import UIKit

public class PickerViewController : UIViewController, StoryboardInstantiatable {
    public static func showPicker(viewController: UIViewController , items:[PickerItemViewModel], selectedIndex: Int = 0) {
        let picker = PickerViewController.instantiate()
        picker.items = items
        picker.selectedIndex = selectedIndex
        if let tabBarController = viewController.tabBarController {
            tabBarController.present(picker, animated: false) {picker.showPicker()}
        } else {
            viewController.present(picker, animated: false) {picker.showPicker()}
        }
    }
    
    fileprivate var items: [PickerItemViewModel] = []
    fileprivate var selectedIndex : Int = 0
    
    @IBOutlet private weak var pickerView :UIPickerView?
    @IBOutlet private weak var backgroundView :UIView?
    @IBOutlet private weak var pickerBackY :NSLayoutConstraint?
    
    var completion :((String) -> ())?
    
    override public var modalPresentationStyle: UIModalPresentationStyle {
        get {
            return UIModalPresentationStyle.overCurrentContext
        }
        set {
            super.modalPresentationStyle = newValue
        }
    }
    
    private func showPicker() {
        pickerView?.selectRow(selectedIndex, inComponent: 0, animated: false)
        UIView.animate(withDuration: 0.25) {
            self.backgroundView!.alpha = 0.6
            self.pickerBackY!.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    
    private func showPicker(completion:@escaping (String) -> ()) {
        self.completion = completion
        UIView.animate(withDuration: 0.25) {
            self.backgroundView!.alpha = 0.6
            self.pickerBackY!.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func hidePicker() {
        UIView.animate(withDuration: 0.25, animations: {
            self.backgroundView!.alpha = 0
            self.pickerBackY!.constant = -220
            self.view.layoutIfNeeded()
        }) { finished in
            self.dismiss(animated: false) {
                self.completion?("a")
                self.completion = nil
                if self.selectedIndex >= 0 {
                    self.items[self.selectedIndex].onSelected?()
                }
            }
        }
    }
    
    @IBAction private func complete() {
        self.hidePicker()
    }
    
    @IBAction private func cancel() {
        self.completion = nil
        selectedIndex = -1
        self.hidePicker()
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
