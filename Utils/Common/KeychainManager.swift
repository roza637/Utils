//
//  KeychainManager.swift
//  Utils
//
//  Created by fxgmo on 2017/11/01.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public class KeychainManager {
    
    // MARK: ErrorTypes
    private enum KeychainError: Error {
        case ItemNotFound
        case UnhandledError(status: OSStatus)
    }
    
    // MARK: - keychain configuration
    public struct Config {
        var serviceName = ""
        var accessGroup: String? = nil
    }
    
    private(set) var config: Config
    
    public convenience init(serviceName: String, accessGroup: String? = nil) {
        self.init(config: Config(serviceName: serviceName, accessGroup: accessGroup))
    }
    
    public init(config: Config) {
        self.config = config
    }
    
    
    // MARK: - public keychain access
    public func saveString(key: String, value: String?) {
        if let value = value {
            _ = self.save(key: key, data: value.data(using: .utf8)!)
        } else {
            _ = self.delete(key: key)
        }
    }

    public func loadString(key: String) -> String? {
        if let data = self.load(key: key) {
            return String(data: data, encoding: .utf8)
        } else {
            return nil
        }
    } 
    
    public func deleteString(key: String) {
        _ = self.delete(key: key)
    }
    
    private func keychainQuery(withService service: String, account: String?, accessGroup: String?) -> [String : AnyObject] {
        var query = [String : AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrService as String] = service as AnyObject?
        query[kSecAttrAccessible as String] = kSecAttrAccessibleAlways as AnyObject?
        
        if let account = account {
            query[kSecAttrAccount as String] = account as AnyObject?
        }
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup as AnyObject?
        }
        
        return query
    }
    
    // MARK: - private low keychainAccess
    private func save(key: String, data: Data) -> Bool {
        if data.count == 0 {
            return self.delete(key: key)
        } else {
            if let _ = self.load(key: key) {
                // データ上書き
                var attributesToUpdate = [String : AnyObject]()
                attributesToUpdate[kSecValueData as String] = data as AnyObject
                
                let query = self.keychainQuery(withService: config.serviceName, account: key, accessGroup: config.accessGroup)
                let osStatus = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
                
                return osStatus == noErr
            } else {
                // 新規データ保存
                var newItem = self.keychainQuery(withService: config.serviceName, account: key, accessGroup: config.accessGroup)
                newItem[kSecValueData as String] = data as AnyObject?
                let status = SecItemAdd(newItem as CFDictionary, nil)
                return status == noErr
            }
        }
    }
    
    private func load(key: String) -> Data? {
        var query = self.keychainQuery(withService: config.serviceName, account: key, accessGroup: config.accessGroup)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if status == noErr, let result = queryResult as? [String : AnyObject] {
            return result[kSecValueData as String] as? Data
        } else {
            return nil
        }
    }
    
    private func delete(key: String) -> Bool {
        let query = self.keychainQuery(withService: config.serviceName, account: key, accessGroup: config.accessGroup)
        let status = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
    
}
