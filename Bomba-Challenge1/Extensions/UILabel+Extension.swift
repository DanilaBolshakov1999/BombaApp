//
//  UILabel+Extension.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 12.08.2023.
//

import UIKit

extension UILabel {
    convenience init(labelName: String) {
        self.init()
        self.font = .boldSystemFont(ofSize: 15)
        self.text = labelName
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
