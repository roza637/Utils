//
//  UserDefaultExtension.swift
//  Utils
//
//  Created by roza on 2017/11/01.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

extension UserDefaults {
    func setBoolSync(_ value: Bool, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func bool(forKey key: String, defaultValue: Bool) -> Bool {
        self.register(defaults: [key : defaultValue])
        return self.bool(forKey: key)
    }
    
    func setStringSync(_ value: String, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func string(forKey key: String, defaultValue: String) -> String {
        self.register(defaults: [key : defaultValue])
        return self.object(forKey: key) as? String ?? defaultValue
    }
    
    func setIntegerSync(_ value: Int, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func integer(forKey key: String, defaultValue: Int) -> Int {
        self.register(defaults: [key : defaultValue])
        return self.integer(forKey: key)
    }
    
    func setDoubleSync(_ value: Double, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func double(forKey key: String, defaultValue: Double) -> Double {
        self.register(defaults: [key : defaultValue])
        return self.double(forKey: key)
    }
    
    func setFloatSync(_ value: Float, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func float(forKey key: String, defaultValue: Float) -> Float {
        self.register(defaults: [key : defaultValue])
        return self.float(forKey: key)
    }
    
    func setUrlSync(_ value: URL, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func url(forKey key: String, defaultValue: URL) -> URL {
        self.register(defaults: [key : defaultValue])
        return self.url(forKey: key) ?? defaultValue
    }
    
    func setObjectSync(_ value: Any, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    func object(forKey key: String, defaultValue: Any) -> Any {
        self.register(defaults: [key : defaultValue])
        return self.object(forKey: key) ?? defaultValue
    }
    
}
