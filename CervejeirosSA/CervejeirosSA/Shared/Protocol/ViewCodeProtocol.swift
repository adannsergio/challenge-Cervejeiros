//
//  ViewCodeProtocol.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 04/02/23.
//

import Foundation

protocol ViewCodeProtocol {
    func viewCodeSetup()
    func setViewHierarchy()
    func setConstraints()
    func setAdditionalConfiguration()
}

extension ViewCodeProtocol {
    func viewCodeSetup() {
        setViewHierarchy()
        setConstraints()
        setAdditionalConfiguration()
    }
}
