//
//  UIImageView.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 12.08.2023.
//

import UIKit

extension UIImageView  {
    
    static func view29x29(imageName: String) -> UIImageView {
        let view = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 29, height: 29)))
        view.image = UIImage(named: imageName)
        view.contentMode = .scaleAspectFit
        return view
    }
}
