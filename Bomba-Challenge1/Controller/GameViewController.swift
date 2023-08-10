//
//  GameViewController.swift
//  Bomba-Challenge1
//
//  Created by iOS - Developer on 07.08.2023.
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
    
    private lazy var backgroundView: UIView = {
        let verticalView = UIView()
        verticalView.layer.cornerRadius = 20
        verticalView.layer.shadowColor = UIColor.black.cgColor
        verticalView.layer.shadowRadius = 10
        verticalView.layer.shadowOffset = CGSize.zero
        verticalView.layer.shadowOpacity = 1
        verticalView.layer.addSublayer(gradientLayer)
        verticalView.translatesAutoresizingMaskIntoConstraints = false
        return verticalView
    }()
    
    private lazy var mainTwoStackView: UIStackView = {
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
        gradientLayer.frame = backgroundView.bounds
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
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                                          NSAttributedString.Key.foregroundColor: UIColor(named: "purpleText") ?? .white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        
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
    }
    
    @objc private func addTappedBack() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    @objc private func addTappedPause() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(backgroundView)
        view.addSubview(mainTwoStackView)
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
            
            button.widthAnchor.constraint(equalToConstant: 274),
            button.heightAnchor.constraint(equalToConstant: 79)
        ])
    }
}
