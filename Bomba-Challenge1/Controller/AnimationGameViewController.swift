//
//  AnimationGameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 10.08.2023.
//

import UIKit

final class AnimationGameViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }()
    
    private lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 1
        view.layer.addSublayer(gradientLayer)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 5
        element.alignment = .center
        element.distribution = .fillProportionally
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainLabelView: UILabel = {
        let label = UILabel()
        label.text = "Вопрос"
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGame: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "bombGame")
        background.contentMode = .scaleAspectFit
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = mainBackgroundView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        configureNavController()
        setupConstrains()
    }
    
    private func configureNavController() {
        title = "Игра"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white
        ]
        
        let leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrow"),
            style: .done, target: self,
            action: #selector(addTappedBack)
        )
        
        let rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "pause"),
            style: .done, target: self,
            action: #selector(addTappedPause)
        )
        
        leftBarButtonItem.tintColor = .black
        rightBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    @objc private func addTappedBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addTappedPause() {
        navigationController?.pushViewController(GameEndViewController(), animated: true)
    }
}

extension AnimationGameViewController {
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(mainBackgroundView)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainLabelView)
        mainStackView.addArrangedSubview(backgroundGame)
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            mainBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}



