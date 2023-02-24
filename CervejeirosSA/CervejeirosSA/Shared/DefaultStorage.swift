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
    func append<T>(value: T, for key: DefaultStorage.Key)
    func remove<T>(value: T, for key: DefaultStorage.Key) where T: Equatable
    func erase()
}

class DefaultStorage: DefaultStorageProtocol {
    private let shared: UserDefaults

    init(shared: UserDefaults = UserDefaults.standard) {
        self.shared = shared
    }

    func set(value: Any?, for key: Key) {
        shared.set(value, forKey: key.rawValue)
    }

    func get<T>(from key: Key) -> T? {
        guard let currentValue = shared.object(forKey: key.rawValue) else {
            return nil
        }

        return currentValue as? T
    }

    func append<T>(value: T, for key: Key) {
        guard let currentValue = get(from: key) as [T]? else {
            set(value: [value], for: key)
            return
        }

        var updatedValue = currentValue as [T]
        updatedValue.append(value)

        set(value: updatedValue, for: key)
    }

    func remove<T>(value: T, for key: Key) where T : Equatable {
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
