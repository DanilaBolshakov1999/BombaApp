//
//  UILabel+Extension.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 12.08.2023.
//

import UIKit

extension UILabel {
    static func label(with name: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = name
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    convenience init(labelName: String) {
        self.init()
        self.font = .boldSystemFont(ofSize: 15)
        self.text = labelName
        self.numberOfLines = 0
        self.textAlignment = .left
        //self.translatesAutoresizingMaskIntoConstraints = false
    }
}
