//
//  UIImageView.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 12.08.2023.
//

import UIKit

extension UIImageView  {
    convenience init(imageName: String) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: 29, height: 29)))
        self.image = UIImage(named: imageName)
    }
}
