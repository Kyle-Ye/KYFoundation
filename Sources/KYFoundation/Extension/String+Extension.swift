//
//  String+Extension.swift
//
//
//  Created by Kyle on 2024/7/27.
//

import Foundation

extension String: KYProtocol {}

// MARK: - Localized

extension KYWrapper where Base == String {
    public var localized: String {
        NSLocalizedString(base, comment: "")
    }
}

