//
//  TableCellTableViewCell.swift
//  Bomba-Challenge1
//
//  Created by admin on 08.08.2023.
//

import UIKit

final class TableCell: UITableViewCell {
    
    static var reuseID: String {
        String(describing: Self.self)
    }
    
    private lazy var ruleImageNumber: UIImageView = {
        let imageNumber = UIImageView()
        return imageNumber
    }()
    
    private lazy var ruleTextLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.numberOfLines = 0
        return numberLabel
    }()
    
    func getData(image: String, ruleText: String) {
        self.ruleImageNumber.image = UIImage(named: image)
        self.ruleTextLabel.text = ruleText
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(ruleImageNumber)
        self.addSubview(ruleTextLabel)
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        ruleImageNumber.frame = CGRect(x: 16,
                                       y: 16,
                                       width: 29,
                                       height: 29)
        
        ruleTextLabel.frame = CGRect(x: ruleImageNumber.frame.maxX,
                                     y: 16,
                                     width: self.frame.width - ruleImageNumber.frame.width - 32 - 32,
                                     height: self.frame.height - 32)
    }
}
