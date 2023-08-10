//
//  GameViewController.swift
//  Bomba-Challenge1
//
//  Created by iOS - Developer on 07.08.2023.
//

import UIKit

final class GameViewController: UIViewController {
    
    //MARK: - UI
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 20
        return gradientLayer
      }()
    lazy var verticalView: UIView = {
        let verticalView = UIView()
        verticalView.layer.cornerRadius = 20
        verticalView.layer.shadowColor = UIColor.black.cgColor
        verticalView.layer.shadowRadius = 10
        verticalView.layer.shadowOffset = CGSize.zero
        verticalView.layer.shadowOpacity = 1
        verticalView.backgroundColor = .darkGray
        verticalView.layer.addSublayer(gradientLayer)
        return verticalView
      }()
    
    private lazy var backgroundView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "backgroundImage")
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainTwoStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 5
        element.alignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainOneStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 3
        element.alignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainLabelView: UILabel = {
        let label = UILabel()
        label.text = """
        Нажмите
        "Запустить" чтобы
        начать игру
        """
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGame: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "bombGame")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var button: UIButton = {
        var element = UIButton(type: .system)
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.backgroundColor = UIColor.purpleButton
        element.layer.cornerRadius = 35
        element.setTitle("Запустить", for: .normal)
        element.setTitleColor(.yellow, for: .normal)
        element.layer.borderWidth = 2

        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        gradientLayer.frame = verticalView.bounds
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstrains()
    }
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(backgroundView)
        view.addSubview(mainTwoStackView)
        mainTwoStackView.addArrangedSubview(mainOneStackView)
        mainTwoStackView.addArrangedSubview(mainLabelView)
        mainTwoStackView.addArrangedSubview(backgroundGame)
        mainTwoStackView.addArrangedSubview(button)
    }
}

    //MARK: - Setup Constraints

extension GameViewController {
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainTwoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTwoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTwoStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainTwoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            mainLabelView.widthAnchor.constraint(equalToConstant: 314),
            mainLabelView.heightAnchor.constraint(equalToConstant: 150),
            
            mainOneStackView.widthAnchor.constraint(equalToConstant: 314),
            mainOneStackView.heightAnchor.constraint(equalToConstant: 75),
            
            backgroundGame.widthAnchor.constraint(equalToConstant: 312),
            backgroundGame.heightAnchor.constraint(equalToConstant: 352),
            
            button.widthAnchor.constraint(equalToConstant: 274),
            button.heightAnchor.constraint(equalToConstant: 79),
        ])
    }
}
