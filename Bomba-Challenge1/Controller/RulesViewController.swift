//
//  RulesVCViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 08.08.2023.
//

import UIKit
import SnapKit

final class RulesViewController: UIViewController {
    
    //MARK: - UI
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }()
    
    private lazy var gradientBackgroundView: UIView = {
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
    
//    private lazy var contentView: UIView = {
//        let contentView = UIView()
//        contentView.frame.size = contentSize
//        return contentView
//    }()
    
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        //stackView.backgroundColor = .gray
//        stackView.spacing = 10
//        return stackView
//    }()
    
    private lazy var labelTitle: UILabel = { //???
        let label = UILabel()
        label.text = "Правила Игры"
        label.numberOfLines = 0
        label.textColor = UIColor.purpleText
        label.textAlignment = .center
        //label.layer.borderColor = UIColor.black.cgColor
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let stackViewGeneral: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .leading//
//        stackView.spacing = 0
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
//    lazy var playButton: UIButton = {
//        var button = UIButton(type: .system)
//        button.titleLabel?.font = .systemFont(ofSize: 25)
//        button.backgroundColor = UIColor.purpleButton
//        button.layer.cornerRadius = 35
//        button.setTitle("Cтарт Игры", for: .normal)
//        button.setTitleColor(.yellow, for: .normal)
//        button.layer.borderWidth = 2
//        button.contentMode = .scaleAspectFit
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    ///MARK: - Stacks UPDATE!!!
    
//    private let stackViewAndLabelOne: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        return stackView
//    }()
//
//    private let stackViewAndLabelTwo: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        return stackView
//    }()
//
//    private let stackViewAndLabelThree: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private let stackViewAndLabelFour: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private let stackViewAndLabelFive: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private let stackViewAndLabelSix: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private let stackViewAndLabelSeven: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .leading
//        //stackView.backgroundColor = .brown
//        stackView.spacing = 5
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 1000) //MARK: - change to xMax
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = gradientBackgroundView.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        //setupColors()
        configureNavController()
        setupConstrains()
    }
    
    //MARK: - Private Properties
    
    private lazy var imageViewOne = UIImageView(image: UIImage(named: "numberOne"))
    private lazy var imageViewTwo = UIImageView(image: UIImage(named: "numberThree"))
    private lazy var imageViewThree = UIImageView(image: UIImage(named: "numberThree"))
    private lazy var imageViewFour = UIImageView(image: UIImage(named: "numberFour"))
    private lazy var imageViewFive = UIImageView(image: UIImage(named: "numberFive"))
    private lazy var imageViewSix = UIImageView(image: UIImage(named: "numberSix"))
    private lazy var imageViewSeven = UIImageView(image: UIImage(named: "numberSeven"))
    
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
            NSAttributedString.Key.foregroundColor: UIColor.purpleText ?? .white
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
    
    private func setupViews() {
        view.addSubview(gradientBackgroundView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(labelTitle)
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstrains() {
        
        gradientBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
    }
}
