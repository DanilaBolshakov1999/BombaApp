//
//  GameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 07.08.2023.
//

import UIKit

final class GameViewController: UIViewController {
    
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
        label.text = """
        Нажмите
        "Запустить" чтобы
        начать игру
        """
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGameImageView: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "bombGame")
        background.contentMode = .scaleAspectFit
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    lazy var playButton: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = UIColor.purpleButton
        button.layer.cornerRadius = 35
        button.setTitle("Запустить", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        playButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
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
            action: #selector(backButtonTapped)
        )
        
        leftBarButtonItem.tintColor = .black
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension GameViewController {
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(mainBackgroundView)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainLabelView)
        mainStackView.addArrangedSubview(backgroundGameImageView)
        mainStackView.addArrangedSubview(playButton)
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
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            playButton.widthAnchor.constraint(equalToConstant: 274),
            playButton.heightAnchor.constraint(equalToConstant: 79)
        ])
    }
    
    //MARK: - Button methods
    
    @objc private func startGameButtonPressed() {
        navigationController?.pushViewController(AnimationGameViewController(), animated: true)
    }

}
