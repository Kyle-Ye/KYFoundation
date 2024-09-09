//
//  Env.swift
//
//
//  Created by Kyle on 2024/4/23.
//

import Darwin

public enum Env {
    public static var hotAreaMaskViewTag = 0xABCD
    
    public static var showHotAreaMask: Bool {
        guard Target.isDebug else {
            return false
        }
        return _forceShowHotAreaMask || EnvironmentHelper.value(for: "KY_SHOW_HOT_AREA_MASK") == 1
    }
    
    @_spi(DEBUG)
    public static var _forceShowHotAreaMask = false
}


public enum EnvironmentHelper {
    @_transparent
    public static func value(for key: String) -> Int32 {
        key.withCString { string in
            guard let env = getenv(string) else {
                return 0
            }
            return atoi(env)
        }
    }
}
