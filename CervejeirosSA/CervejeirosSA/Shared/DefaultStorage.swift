//
//  DefaultStorage.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 23/02/23.
//

import Foundation

protocol DefaultStorageProtocol {
    func set(value: Any?, for key: DefaultStorage.Key)
    func get<T>(from key: DefaultStorage.Key) -> T?
    func append<T: DefaultStorage.UniquelySortable>(value: T, for key: DefaultStorage.Key)
    func contains<T: Equatable>(value: T, for key: DefaultStorage.Key) -> Bool
    func remove<T: Equatable>(value: T, for key: DefaultStorage.Key)
    func erase()
}

class DefaultStorage: DefaultStorageProtocol {
    typealias UniquelySortable = Equatable & Comparable
    
    private let shared: UserDefaults

    init(shared: UserDefaults = UserDefaults.standard) {
        self.shared = shared
    }

    func set(value: Any?, for key: Key) {
        shared.set(value, forKey: key.rawValue)
    }

    func get<T>(from key: Key) -> T? {
        return shared.object(forKey: key.rawValue) as? T
    }

    func append<T: UniquelySortable>(value: T, for key: Key) {
        var currentValues = shared.array(forKey: key.rawValue) as? [T] ?? [T]()
        
        if !currentValues.contains(value) {
            currentValues.append(value)
            currentValues.sort(by: <)
            shared.set(currentValues, forKey: key.rawValue)
        }
    }
    
    func contains<T: Equatable>(value: T, for key: Key) -> Bool {
        let currentValues = shared.array(forKey: key.rawValue) as? [T] ?? [T]()
        
        if currentValues.contains(value) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func remove<T: Equatable>(value: T, for key: Key) {
        var currentValue = get(from: key) as [T]?
        currentValue?.removeAll(where: { $0 == value })

        set(value: currentValue, for: key)
    }

    func erase() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("Missing CFBundleIdentifier value")
        }

        shared.removePersistentDomain(forName: bundleIdentifier)
    }
}

extension DefaultStorage {
    enum Key: String {
        case beerID
    }
}
