//
//  URL+DownloadImage.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 16/04/23.
//

import UIKit

extension URL {
    func downloadImage(completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: self), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
