//
//  DatePickerViewController.swift
//  Utils
//
//  Created by roza on 2016/10/17.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation
import UIKit

public class DatePickerViewController : UIViewController, StoryboardInstantiatable, OverlayPresentation {
    
    public static var bundle: Bundle? {
        return Bundle(for: DatePickerViewController.self)
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
        if self.selectedDate != nil {
            self.completion?(self.selectedDate!)
        }
        self.completion = nil
    }
    
    public static func showPicker(date: Date? = Date(), minDate: Date? = nil, maxDate: Date? = nil, completion: @escaping (Date) -> ()) {
        let picker = DatePickerViewController.instantiate()
        picker.selectedDate = date ?? Date()
        picker.minDate = minDate
        picker.maxDate = maxDate
        picker.completion = completion
        picker.showOverlay()
    }

    private var selectedDate : Date? = Date()
    private var minDate : Date?
    private var maxDate : Date?
    
    @IBOutlet private weak var pickerView :UIDatePicker?
    @IBOutlet private weak var backgroundView :UIView?
    @IBOutlet private weak var pickerBackY :NSLayoutConstraint?
    
    private var completion :((Date) -> ())?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        pickerView?.date = selectedDate!
        pickerView?.minimumDate = minDate
        pickerView?.maximumDate = maxDate
    }
    
    @IBAction private func complete() {
        selectedDate = pickerView?.date
        self.hideOverlay()
    }
    
    @IBAction private func cancel() {
        self.completion = nil
        selectedDate = nil
        self.hideOverlay()
    }
}
