//
//  YQDefaultValue.swift
//  Pods
//
//  Created by 王叶庆 on 2022/10/9.
//

import Foundation


public protocol DefaultValue {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}


@propertyWrapper
public struct Default<T: DefaultValue> {
    public var wrappedValue: T.Value
    public init(wrappedValue: T.Value) {
        self.wrappedValue = wrappedValue
    }
}

extension Default: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}

public extension Bool {
    enum False: DefaultValue {
        static public let defaultValue = false
    }
    enum True: DefaultValue {
        static public let defaultValue = true
    }
}

public extension Default {
    typealias True  = Default<Bool.True>
    typealias False = Default<Bool.False>
}

extension String: DefaultValue {
    public static let defaultValue = ""
}

extension Int: DefaultValue {
    public static let defaultValue = 0
}
extension Int8: DefaultValue {
    public static let defaultValue = 0
}
extension Int16: DefaultValue {
    public static let defaultValue: Int16 = 0
}
extension Int32: DefaultValue {
    public static let defaultValue: Int32 = 0
}
extension Int64: DefaultValue {
    public static let defaultValue: Int64 = 0
}
extension UInt: DefaultValue {
    public static let defaultValue: UInt = 0
}
extension UInt8: DefaultValue {
    public static let defaultValue: UInt8 = 0
}
extension UInt16: DefaultValue {
    public static let defaultValue: UInt16 = 0
}
extension UInt32: DefaultValue {
    public static let defaultValue: UInt32 = 0
}
extension UInt64: DefaultValue {
    public static let defaultValue: UInt64 = 0
}
extension Float: DefaultValue {
    public static let defaultValue: Float = 0
}
extension Double: DefaultValue {
    public static let defaultValue: Double = 0
}
extension Array: DefaultValue where Element: Codable {
    public static var defaultValue: [Element] {
        [Element]()
    }
    public typealias Value = [Element]
}
