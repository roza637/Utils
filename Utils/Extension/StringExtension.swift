//
//  StringExtension.swift
//  Utils
//
//  Created by roza on 2016/11/11.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    public var decimal: NSDecimalNumber {
        return NSDecimalNumber(string: self)
    }
}

public extension String {
    
    public var urlImage: UIImage? {
        if let url = URL(string: self) {
            do {
                return try UIImage(data: Data(contentsOf: url))
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    public var length: Int {
        return self.characters.count
    }
    
    public func substring(to: Int) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: to))
    }
    
    public func substring(from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }

    public func substring(from: Int, length: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(startIndex, offsetBy: length)
        
        return self.substring(with: start..<end)
    }

    public var isDouble: Bool {
        let components = self.components(separatedBy: ".")
        return 1 < components.count
    }

    public var secureString: String {
        return (0 ..< self.length).reduce("") {
            return $0.0 + "*"
        }
    }
    
    public var intValue: Int? {
        return Int(self)
    }
    
    public var doubleValue: Double? {
        return Double(self)
    }
    
    public var url: URL? {
        return URL(string: self)
    }
    
    public var fileUrl: URL {
        return URL(fileURLWithPath: self)
    }
}

public extension String {
    public func withFont(_ value: UIFont, range: NSRange? = nil) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self).withFont(value, range: range)
    }
    
    public func withTextColor(_ value: UIColor, range: NSRange? = nil) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self).withTextColor(value, range: range)
    }
    
    public func withBackgroundColor(_ value: UIColor, range: NSRange? = nil) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self).withBackgroundColor(value, range: range)
    }
}

public extension NSMutableAttributedString {
    
    public func withFont(_ value: UIFont, range: NSRange? = nil) -> NSMutableAttributedString {
        self.addAttributes([NSFontAttributeName : value], range: range ?? NSMakeRange(0, length))
        return self
    }
    
    public func withTextColor(_ value: UIColor, range: NSRange? = nil) -> NSMutableAttributedString {
        self.addAttributes([NSForegroundColorAttributeName : value], range: range ?? NSMakeRange(0, length))
        return self
    }
    
    public func withBackgroundColor(_ value: UIColor, range: NSRange? = nil) -> NSMutableAttributedString {
        self.addAttributes([NSBackgroundColorAttributeName : value], range: range ?? NSMakeRange(0, length))
        return self
    }
    
}

public protocol StringOptionalExtensionProtocol {
    var value: String {get}
}

extension String: StringOptionalExtensionProtocol {
    public var value: String {
        return self
    }
}

extension Optional where Wrapped: StringOptionalExtensionProtocol {
    public var isNilOrEmpty: Bool {
        switch self {
        case .none:
            return true
        case let .some(value):
            return value.value.isEmpty
        }
    }
    
    public var emptyAsNil: String? {
        return isNilOrEmpty ? nil : self?.value
    }
}
