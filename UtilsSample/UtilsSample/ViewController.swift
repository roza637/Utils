//
//  ViewController.swift
//  UtilsSample
//
//  Created by fxgmo on 2017/11/02.
//  Copyright © 2017年 roza. All rights reserved.
//

import UIKit
import Utils

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.onTouchDown{ _ in
            ToastManager.shared.show(message: "button1 touchdown")
        }
        button1.onTouchUpInside{ [weak self] _ in
            PickerViewController.showPicker(items: (0...10).map{ String($0) }.map{ str in PickerItemViewModel(title: str, onSelected: { self?.button1.setTitle(str, for: .normal) }) })
        }
        
        button2.onTouchDown{ _ in
            ToastManager.shared.show(message: "button2 touchdown")
        }
        button2.onTouchUpInside{ [weak self] _ in
            DatePickerViewController.showPicker(completion: {
                self?.button2.setTitle($0.string(format: "yyyyMMdd"), for: .normal)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func taped() {

    }
}

