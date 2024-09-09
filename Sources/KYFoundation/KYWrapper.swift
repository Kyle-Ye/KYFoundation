//
//  KYWrapper.swift
//  gomerry
//
//  Created by Kyle on 2024/4/19.
//

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
    public var KY: KYWrapper<Self> { KYWrapper(self) }
    
    @_transparent
    public static var KY: KYWrapper<Self>.Type { KYWrapper.self }
}

extension Optional where Wrapped == KYProtocol {
    @_transparent
    public var KY: KYWrapper<Wrapped>? {
        map { KYWrapper($0) }
    }
}
