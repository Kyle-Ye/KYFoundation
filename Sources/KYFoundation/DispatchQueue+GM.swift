//
//  DispatchQueue+KY.swift
//
//
//  Created by Kyle on 2024/4/20.
//

import class Foundation.Thread
import class Dispatch.DispatchQueue

extension DispatchQueue: KYProtocol {}

extension KYWrapper where Base == DispatchQueue {
    public static func async(_ action: @escaping () -> Void) {
        if Thread.isMainThread {
            action()
        } else {
            DispatchQueue.main.async {
                action()
            }
        }
    }
}
