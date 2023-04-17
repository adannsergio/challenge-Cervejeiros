import UIKit

protocol DefaultStorageProtocol {
    func set(value: Any?, for key: DefaultStorageKeys)
    func get<T>(from key: DefaultStorageKeys) -> T?
}

enum DefaultStorageKeys: String {
    case beerID
}

class DefaultStorage: DefaultStorageProtocol {
    private var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func set(value: Any?, for key: DefaultStorageKeys) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func get<T>(from key: DefaultStorageKeys) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
    }
    
    func append<T>(value: T, for key: DefaultStorageKeys) -> [T]? {
        // Cria um novo array, caso não há objeto para a key fornecida
        guard let currentValue = get(from: key) as [T]? else {
            set(value: [value], for: key)
            return value as? [T]
        }
        
        var endStateValue = currentValue as [T]
        endStateValue.append(value)
        
        set(value: endStateValue, for: key)
        
        return endStateValue
    }
    
    func remove<T>(value: T, for key: DefaultStorageKeys) where T: Equatable {
        var currentArray = get(from: key) as [T]?
        currentArray?.removeAll(where: { $0 == value })
        
        set(value: currentArray, for: key)
    }
    
    func clear() {
        guard let domain = Bundle.main.bundleIdentifier else {
            fatalError("Was not possible get bundleIdentifier from Bundle")
        }
        userDefaults.removePersistentDomain(forName: domain)
    }
    
}

let storage = DefaultStorage()
let storage2 = DefaultStorage()

//storage.clear()

storage2.get(from: .beerID) as [Int]?

//storage.append(value: 1, for: .beerID)

storage2.get(from: .beerID) as [Int]?

//storage2.remove(value: 1, for: .beerID)

storage2.get(from: .beerID) as [Int]?

