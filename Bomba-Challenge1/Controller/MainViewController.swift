//
//  MainViewController.swift
//  Bomba-Challenge1
//
//  Created by Дмитрий Лоренц on 08.08.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    //MARK: Propperties
    var backgroungImageView: UIImageView = {
        let backgroundImage = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: backgroundImage)
        return imageView
    }()
    var rulesButton: UIButton = {
        let button = UIButton()
        let rulesImage = UIImage(named: "rules")
        button.setImage(rulesImage, for: .normal)
        return button
    }()
    
    var startGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purpleButton
        button.setTitle("Старт игры", for: .normal)
        button.tintColor = .yellowText
        
        return button
    }()
    
    var categoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purpleButton
        button.setTitle("Категории", for: .normal)
        button.tintColor = .yellowText
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundCornersForButtons()
    }
    
//MARK: Methods
    func setOutlets() {
        view.addSubview(backgroungImageView)
        view.addSubview(rulesButton)
        view.addSubview(categoryButton)
        view.addSubview(startGameButton)
        
    }
    
    func setConstraints() {
        backgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        rulesButton.snp.makeConstraints { make in
            make.height.width.equalTo(58)
            make.bottom.trailing.equalToSuperview().inset(17)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.height.equalTo(79)
            make.leading.trailing.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(94)
        }
        
        startGameButton.snp.makeConstraints { make in
            make.leading.trailing.height.equalTo(categoryButton)
            make.bottom.equalTo(categoryButton.snp.top).inset(-15)
        }
        
    }
    
    fileprivate func roundCornersForButtons() {
        startGameButton.layer.cornerRadius = startGameButton.bounds.height / 2
        categoryButton.layer.cornerRadius = categoryButton.bounds.height / 2
    }

}
