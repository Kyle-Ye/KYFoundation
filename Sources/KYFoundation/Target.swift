//
//  Target.swift
//
//
//  Created by Kyle on 2024/9/10.
//

import Foundation

public enum Target {
    @_transparent
    public static var isDebug: Bool {
        #if DEBUG
        true
        #else
        false
        #endif
    }
    
    @_transparent
    public static var isRelease: Bool {
        #if DEBUG
        false
        #else
        true
        #endif
    }
}
