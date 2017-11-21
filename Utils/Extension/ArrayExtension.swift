//
//  ArrayExtension.swift
//  Utils
//
//  Created by roza on 2016/11/24.
//  Copyright © 2016年 roza. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    public var distinct: [Element] {
        var a: [Element] = []
        self.forEach{
            if !a.contains($0) {
                a.append($0)
            }
        }
        return a
    }
}

public extension Array {
    
    public func distinct(isEquivalent: (Element, Element) -> Bool) -> [Element] {
        return self.reduce([]) { (a: [Element], e: Element) -> [Element] in
            a.filter{ isEquivalent($0, e) }.count > 0 ? a : a + [e]
        }
    }
    
    public var random: Element? {
        return self.shuffled.first
    }
    
    public var shuffled: [Element] {
        return self.map{ ($0, arc4random()) }.sorted{ $0.0.1 < $0.1.1 }.map{ $0.0 }
    }
}

public extension Array {
    public mutating func move(from: Int, to: Int) {
        let fromObject = self[from]
        
        self.remove(at: from)
        self.insert(fromObject, at: to)
    }
}

public extension Sequence {
    public func parallelForEach(_ action: @escaping (Self.Iterator.Element) -> ()) {
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        for e in self {
            queue.async(group: group) {
                action(e)
            }
        }
        group.wait()
    }
    
//    public func groupBy<Key: Hashable>(keySelector: @escaping (Iterator.Element) -> Key) -> [Key : [Iterator.Element]] {
//        return self.reduce([:]){ (acc: [Key : [Iterator.Element]], value) in
//            let key = keySelector(value)
//            var new = acc
//            new[key] = (acc[key] ?? []) + [value]
//            return new
//        }
//    }
    // 上記のように関数型っぽく書きたいが、パフォーマンス向上のため下記のようにする（Swift4にて改善可能？）
    public func groupBy<Key: Hashable>(keySelector: (Iterator.Element) -> Key) -> [Key : [Iterator.Element]] {
        var result: Dictionary<Key, [Iterator.Element]> = [:]
        for value in self {
            let key = keySelector(value)
            if result[key] == nil {
                result[key] = [value]
            } else {
                result[key]!.append(value)
            }
        }
        return result
    }
}
