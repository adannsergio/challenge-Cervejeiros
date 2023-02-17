//
//  String+attributedText.swift
//  CervejeirosSA
//
//  Created by Adann Sergio Simoes on 16/02/23.
//

import UIKit

public extension String {
    
    func attributedText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 16, weight: .regular)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
    
}
