//
//  KYWrapper.swift
//  gomerry
//
//  Created by Kyle on 2024/4/19.
//

// See detail on https://juejin.cn/post/7174675125894119461

@frozen
public struct KYWrapper<Base> {
    public let base: Base
    
    @_transparent
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol KYProtocol {}

extension KYProtocol {
    @_transparent
    public var ky: KYWrapper<Self> { KYWrapper(self) }
    
    @_transparent
    public static var ky: KYWrapper<Self>.Type { KYWrapper.self }
}

extension Optional where Wrapped == KYProtocol {
    @_transparent
    public var ky: KYWrapper<Wrapped>? {
        map { KYWrapper($0) }
    }
}
