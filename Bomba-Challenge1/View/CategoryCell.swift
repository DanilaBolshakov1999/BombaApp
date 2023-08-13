//
//  CategoryCell.swift
//  Bomba-Challenge1
//
//  Created by Андрей Фроленков on 8.08.23.
//

import Foundation
import UIKit

// MARK: - CategoryCell
class CategoryCell: UICollectionViewCell {
  
  // MARK: - Static Properties
  static let reuseIdentifier = "CategoryCell"
  
  // MARK: - Properties
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  lazy var nameCategory: UILabel = {
    let nameCategory = UILabel()
    nameCategory.textAlignment = .center
    nameCategory.textColor = UIColor(red: 250/255, green: 255/255, blue: 0, alpha: 1)
    nameCategory.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    nameCategory.numberOfLines = 0
    return nameCategory
  }()
  
  lazy var checkmark: UIImageView = {
    let checkmark = UIImageView()
      checkmark.image = (self.selectCell) ? UIImage(named: "checkmarkOn") : UIImage(named: "checkmarkOff")
    return checkmark
  }()
  
  var selectCell = false
  
  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
    addSubviews()
    setupLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private Methods
  private func setupCell() {
      backgroundColor = .purpleButton
    
    layer.cornerRadius = 50
    layer.borderWidth = 2
    layer.borderColor = UIColor.black.cgColor
  }
  
  private func addSubviews() {
    addSubview(imageView)
    addSubview(nameCategory)
    addSubview(checkmark)
  }
  
  private func setupLayout() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    nameCategory.translatesAutoresizingMaskIntoConstraints = false
    checkmark.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      imageView.heightAnchor.constraint(equalToConstant: 90),
      imageView.widthAnchor.constraint(equalToConstant: 90),
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
  
      nameCategory.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 1),
      nameCategory.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      nameCategory.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      nameCategory.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      
      checkmark.topAnchor.constraint(equalTo: topAnchor, constant: 15),
      checkmark.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      checkmark.heightAnchor.constraint(equalToConstant: 20),
      checkmark.widthAnchor.constraint(equalToConstant: 20),
      
    ])
    
  }
}
