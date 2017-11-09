//
//  DocumentUtil.swift
//  Utils
//
//  Created by roza on 2017/11/07.
//  Copyright © 2017年 roza. All rights reserved.
//

import Foundation

public class DocumentUtil {
    public enum Directory {
        case documents
        case library
        case applicationSupport
        case caches
        case tmp
        
        public var path: String {
            switch self {
            case .documents:
                return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            case .library:
                return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
            case .applicationSupport:
                return NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
            case .caches:
                return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
            case .tmp:
                return NSTemporaryDirectory()
            }
        }
    }
    
    public static func list(dir: Directory) -> [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: dir.path)
        } catch {
            return []
        }
    }
    
    public static func listPath(dir: Directory) -> [String] {
        return list(dir: dir).map{ "\(dir.path)/\($0)" }
    }
    
    public static func write(data: Data, to dir: Directory, name: String) {
        FileManager.default.createFile(atPath: "\(dir.path)/\(name)", contents: data, attributes: nil)
    }
    
    public static func write(string: String, to dir: Directory, name: String) -> Bool {
        do {
            try string.write(toFile: "\(dir.path)/\(name)", atomically: true, encoding: .utf8)
        } catch {
            return false
        }
        
        return true
    }
    
    public static func readString(from dir: Directory, name: String) -> String? {
        do {
            return try String(contentsOfFile: "\(dir.path)/\(name)", encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    public static func readStringFromDocuments(name: String) -> String? {
        return self.readString(from: .documents, name: name)
    }
    
    public static func readStringFromLibrary(name: String) -> String? {
        return self.readString(from: .library, name: name)
    }
    
    public static func readStringFromTmp(name: String) -> String? {
        return self.readString(from: .tmp, name: name)
    }
    
    public static func readStringFromCaches(name: String) -> String? {
        return self.readString(from: .caches, name: name)
    }
    
    public static func writeToDocuments(string: String, name: String) {
        _ = self.write(string: string, to: .documents, name: name)
    }
    
    public static func writeToLibrary(string: String, name: String) {
        _ = self.write(string: string, to: .library, name: name)
    }
    
    public static func writeToTmp(string: String, name: String) {
        _ = self.write(string: string, to: .tmp, name: name)
    }
    
    public static func writeToCaches(string: String, name: String) {
        _ = self.write(string: string, to: .caches, name: name)
    }
    
    public static func writeToDocuments(data: Data, name: String) {
        self.write(data: data, to: .documents, name: name)
    }
    
    public static func writeToLibrary(data: Data, name: String) {
        self.write(data: data, to: .library, name: name)
    }
    
    public static func writeToTmp(data: Data, name: String) {
        self.write(data: data, to: .tmp, name: name)
    }

    public static func writeToCaches(data: Data, name: String) {
        self.write(data: data, to: .caches, name: name)
    }
    
}
