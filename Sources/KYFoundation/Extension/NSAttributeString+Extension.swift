//
//  NSAttributeString+Extension.swift
//
//
//  Created by Kyle on 2024/8/6.
//

import Foundation
import KYFoundation

extension NSAttributedString: KYProtocol {}

public final class TextBackedString: NSObject{
    public let string: NSString
    
    public init(string: String) {
        self.string = string as NSString
    }
    
    public init(_ string: NSString) {
        self.string = string
    }
}

extension NSAttributedString.Key {
    public static let textBackedString = NSAttributedString.Key("TextBackedString")
}


extension KYWrapper where Base: NSAttributedString {
    public var rangeOfAll: NSRange {
        NSRange(location: 0, length: base.length)
    }
    
    public func plainTextForRange(range: NSRange) -> String? {
        guard range.location != NSNotFound else {
            return nil
        }
        var result = ""
        guard range.length != 0 else {
            return result
        }
        let string = base.string as NSString
        base.enumerateAttribute(.textBackedString, in: range, options: []) { value, range, _ in
            let backed = value as? TextBackedString
            if let backed {
                result.append(backed.string as String)
            } else {
                result.append(string.substring(with: range))
            }
        }
        return result
    }
    
    public var plainText: String {
        plainTextForRange(range: rangeOfAll) ?? ""
    }
}

extension KYWrapper where Base: NSMutableAttributedString {
    public func setTextBackedString(textBackedString: TextBackedString?, range: NSRange) {
        guard let textBackedString else {
            base.removeAttribute(.textBackedString, range: range)
            return
        }
        base.addAttribute(.textBackedString, value: textBackedString, range: range)
    }
}
