//
//  Array+removeDuplicates.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 16/02/23.
//

import Foundation

public extension Array where Element: Equatable {
    @discardableResult
    mutating func removeDuplicates() -> [Element] {
        self = reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
        return self
    }
}
