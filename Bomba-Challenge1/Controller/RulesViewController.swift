//
//  RulesVCViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 08.08.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        //stackView.backgroundColor = .gray
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var mainLabelView: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackViewGeneral: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading//
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonPlay: UIButton = {
        var button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = UIColor.purpleButton
        button.layer.cornerRadius = 35
        button.setTitle("Cтарт Игры", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 2
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    ///MARK: - Stacks UPDATE!!!
    
    private let stackViewAndLabelOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        return stackView
    }()
    
    private let stackViewAndLabelTwo: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        return stackView
    }()
    
    private let stackViewAndLabelThree: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewAndLabelFour: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewAndLabelFive: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewAndLabelSix: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewAndLabelSeven: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        //stackView.backgroundColor = .brown
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 1000)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = mainBackgroundView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupColors()
        configureNavController()
        setupConstrains()
        buttonPlay.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Private Properties
    
    private lazy var imageViewOne = UIImageView(imageName: "numberOne")
    private lazy var imageViewTwo = UIImageView(imageName: "numberTwo")
    private lazy var imageViewThree = UIImageView(imageName: "numberThree")
    private lazy var imageViewFour = UIImageView(imageName: "numberFour")
    private lazy var imageViewFive = UIImageView(imageName: "numberFive")
    private lazy var imageViewSix = UIImageView(imageName: "numberSix")
    private lazy var imageViewSeven = UIImageView(imageName: "numberSeven")
    
    private lazy var labelOne = UILabel(
        labelName: "Все игроки становятся в круг.")
    
    private lazy var labelTwo = UILabel(
        labelName: """
        "Первый игрок берет телефон
        и нажимает кнопку
""")
    
    private lazy var labelThree = UILabel(
        labelName: """
        На экране появляется вопрос “Назовите Фрукт”.
""")
    
    private lazy var labelFour = UILabel(
        labelName: """
        Игрок отвечает на вопрос и
        после правильного ответа
        передает телефон следующему
        игроку (правильность ответа
        определяют другие участники).
        """)
    
    private lazy var labelFive = UILabel(
        labelName: """
        "Игроки по кругу отвечают на
        один и тот же вопрос до тех пор,
        пока не взорвется бомба.
""")
    private lazy var labelSix = UILabel(
        labelName: """
        Проигравшим считается тот, в
        чьих руках взорвалась бомба.
        """)
    private lazy var labelSeven = UILabel(
        labelName: """
        Если в настройках выбран
        режим игры “С Заданиями”, то
        проигравший выполняет
        задание.
        """)
}

extension RulesViewController {
    
    //MARK: - Configure Nav Controller
    
    private func configureNavController() {
        title = "Помощь"
        
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
        
        leftBarButtonItem.tintColor = .black
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    @objc private func addTappedBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Setup Views
    
    private func setViews() {
        view.addSubview(mainBackgroundView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(mainLabelView)
        
        stackView.addArrangedSubview(stackViewAndLabelOne)
        stackViewAndLabelOne.addArrangedSubview(imageViewOne)
        stackViewAndLabelOne.addArrangedSubview(labelOne)
        
        stackView.addArrangedSubview(stackViewAndLabelTwo)
        stackViewAndLabelTwo.addArrangedSubview(imageViewTwo)
        stackViewAndLabelTwo.addArrangedSubview(labelTwo)
        
        stackView.addArrangedSubview(buttonPlay)
        
        stackView.addArrangedSubview(stackViewAndLabelThree)
        stackViewAndLabelThree.addArrangedSubview(imageViewThree)
        stackViewAndLabelThree.addArrangedSubview(labelThree)
        
        stackView.addArrangedSubview(stackViewAndLabelFour)
        stackViewAndLabelFour.addArrangedSubview(imageViewFour)
        stackViewAndLabelFour.addArrangedSubview(labelFour)
        
        stackView.addArrangedSubview(stackViewAndLabelFive)
        stackViewAndLabelFive.addArrangedSubview(imageViewFive)
        stackViewAndLabelFive.addArrangedSubview(labelFive)
        
        stackView.addArrangedSubview(stackViewAndLabelSix)
        stackViewAndLabelSix.addArrangedSubview(imageViewSix)
        stackViewAndLabelSix.addArrangedSubview(labelSix)
        
        stackView.addArrangedSubview(stackViewAndLabelSeven)
        stackViewAndLabelSeven.addArrangedSubview(imageViewSeven)
        stackViewAndLabelSeven.addArrangedSubview(labelSeven)
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            mainBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 70),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            
//            stackView.widthAnchor.constraint(equalToConstant: 1000),
//            stackView.heightAnchor.constraint(equalToConstant: 1000),
            
            mainLabelView.widthAnchor.constraint(equalToConstant: 380),
            mainLabelView.heightAnchor.constraint(equalToConstant: 96),
            
            imageViewOne.widthAnchor.constraint(equalToConstant: 100),
            imageViewOne.heightAnchor.constraint(equalToConstant: 100),
            labelOne.widthAnchor.constraint(equalToConstant: 380),
            labelOne.heightAnchor.constraint(equalToConstant: 96),
            
            imageViewTwo.widthAnchor.constraint(equalToConstant: 100),
            imageViewTwo.heightAnchor.constraint(equalToConstant: 100),
            labelTwo.widthAnchor.constraint(equalToConstant: 380),
            labelTwo.heightAnchor.constraint(equalToConstant:96),
            
            buttonPlay.widthAnchor.constraint(equalToConstant: 200),
            buttonPlay.heightAnchor.constraint(equalToConstant: 60),
            
            imageViewThree.widthAnchor.constraint(equalToConstant: 100),
            imageViewThree.heightAnchor.constraint(equalToConstant: 100),
            labelThree.widthAnchor.constraint(equalToConstant: 380),
            labelThree.heightAnchor.constraint(equalToConstant:96),
            
            imageViewFour.widthAnchor.constraint(equalToConstant: 100),
            imageViewFour.heightAnchor.constraint(equalToConstant: 100),
            labelFour.widthAnchor.constraint(equalToConstant: 380),
            labelFour.heightAnchor.constraint(equalToConstant:96),
            
            imageViewFive.widthAnchor.constraint(equalToConstant: 100),
            imageViewFive.heightAnchor.constraint(equalToConstant: 100),
            labelFive.widthAnchor.constraint(equalToConstant: 380),
            labelFive.heightAnchor.constraint(equalToConstant:96),
            
            imageViewSix.widthAnchor.constraint(equalToConstant: 100),
            imageViewSix.heightAnchor.constraint(equalToConstant: 100),
            labelSix.widthAnchor.constraint(equalToConstant: 380),
            labelSix.heightAnchor.constraint(equalToConstant:96),
            
            imageViewSeven.widthAnchor.constraint(equalToConstant: 100),
            imageViewSeven.heightAnchor.constraint(equalToConstant: 100),
            labelSeven.widthAnchor.constraint(equalToConstant: 380),
            labelSeven.heightAnchor.constraint(equalToConstant:96)
        ])
        
                for view in stackView.arrangedSubviews {
                    NSLayoutConstraint.activate([
                        view.widthAnchor.constraint(equalToConstant: 350),
                        view.heightAnchor.constraint(equalToConstant: 100)
                    ])
                }
    }
    
    private func setupColors() {
        let colors = [stackViewAndLabelOne]
        for index in 0..<10 {
            let view = UIView()
            stackView.addArrangedSubview(view)
        }
    }
    //MARK: - Button methods
    
    @objc private func startGameButtonPressed() {
        navigationController?.pushViewController(AnimationGameViewController(), animated: true)
    }
}


extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(labelName: String) {
        self.init()
        self.font = .boldSystemFont(ofSize: 15)
        self.text = labelName
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//extension UIStackView {
//    convenience init(arrangedSubviews: [UIView]) {
//        self.init(arrangedSubviews: arrangedSubviews)
//        self.axis = .vertical // Установите нужную ось (горизонтальная - .horizontal, вертикальная - .vertical)
//        self.spacing = 8 // Установите нужное расстояние между представлениями
//        self.alignment = .fill
//        self.distribution = .fill
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//}

