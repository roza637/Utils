//
//  UserDefaultExtension.swift
//  Utils
//
//  Created by roza on 2017/11/01.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public extension UserDefaults {
    public func setBoolSync(_ value: Bool, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func bool(forKey key: String, defaultValue: Bool) -> Bool {
        self.register(defaults: [key : defaultValue])
        return self.bool(forKey: key)
    }
    
    public func setStringSync(_ value: String, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func string(forKey key: String, defaultValue: String) -> String {
        self.register(defaults: [key : defaultValue])
        return self.object(forKey: key) as? String ?? defaultValue
    }
    
    public func setIntegerSync(_ value: Int, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func integer(forKey key: String, defaultValue: Int) -> Int {
        self.register(defaults: [key : defaultValue])
        return self.integer(forKey: key)
    }
    
    public func setDoubleSync(_ value: Double, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func double(forKey key: String, defaultValue: Double) -> Double {
        self.register(defaults: [key : defaultValue])
        return self.double(forKey: key)
    }
    
    public func setFloatSync(_ value: Float, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func float(forKey key: String, defaultValue: Float) -> Float {
        self.register(defaults: [key : defaultValue])
        return self.float(forKey: key)
    }
    
    public func setUrlSync(_ value: URL, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func url(forKey key: String, defaultValue: URL) -> URL {
        self.register(defaults: [key : defaultValue])
        return self.url(forKey: key) ?? defaultValue
    }
    
    public func setObjectSync(_ value: Any, forKey key: String) {
        self.set(value, forKey: key)
        self.synchronize()
    }
    
    public func object(forKey key: String, defaultValue: Any) -> Any {
        self.register(defaults: [key : defaultValue])
        return self.object(forKey: key) ?? defaultValue
    }
    
}
