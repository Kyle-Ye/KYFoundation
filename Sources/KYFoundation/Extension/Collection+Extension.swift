//
//  Collection+Extension.swift
//
//
//  Created by Kyle on 2024/5/22.
//

import Foundation

extension Collection where Index == Int {
    /// Do not abuse the usage, this may affect Collection performance.
    ///
    /// The current Swift Runtime implementation for subscript checking is via precondition
    /// in debug build. And assume the index is always valid in Release build.
    ///
    /// Here we perform the check in all build and return nil if fails.
    ///
    ///     internal func _checkValidSubscript(_ index: Int) {
    ///         _precondition(
    ///         (index >= 0) && (index < immutableCount),
    ///         "Index out of range"
    ///         )
    ///     }
    ///
    /// - Complexity: O(1) if the collection conforms to
    ///   `RandomAccessCollection`; otherwise, O(*n*), where *n* is the length
    ///   of the collection.
    public subscript(safeIndex index: Index) -> Element? {
        guard index >= 0 && index < count else {
            return nil
        }
        return self[index]
    }
}
