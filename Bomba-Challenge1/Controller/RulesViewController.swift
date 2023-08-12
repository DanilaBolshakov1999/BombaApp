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
    private var playButtonImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "gameStartButtonImage"))
        view.contentMode = .scaleAspectFill
        view.frame = CGRect(origin: .zero, size: CGSize(width: 112, height: 27))
        return view
    }()
    
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
    
    private let imageViewOne = UIImageView(imageName: "numberOne")
    private let imageViewTwo = UIImageView(imageName: "numberTwo")
    private let imageViewThree = UIImageView(imageName: "numberThree")
    private let imageViewFour = UIImageView(imageName: "numberFour")
    private let imageViewFive = UIImageView(imageName: "numberFive")
    private let imageViewSix = UIImageView(imageName: "numberSix")
    private let imageViewSeven = UIImageView(imageName: "numberSeven")
    
    private let labelOne = UILabel(
        labelName: "Все игроки становятся в круг.")
    
    private lazy var labelTwo = UILabel(
        labelName: "Первый игрок берет телефон и нажимает кнопку:")
    
    private lazy var labelThree = UILabel(
        labelName: "На экране появляется вопрос “Назовите Фрукт”.")
    
    private lazy var labelFour = UILabel(
        labelName: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).")
    
    private lazy var labelFive = UILabel(
        labelName: "Игроки по кругу отвечают на один и тот же вопрос до тех пор,  пока не взорвется бомба.")
    private lazy var labelSix = UILabel(
        labelName: "Проигравшим считается тот, в чьих руках взорвалась бомба.")
    private lazy var labelSeven = UILabel(
        labelName: "Если в настройках выбран режим игры “С Заданиями”, то проигравший выполняет  задание.")
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
        gradientBackgroundView.addSubview(scrollView)
        
        scrollView.addSubview(labelTitle)
        scrollView.addSubview(imageViewOne)
        scrollView.addSubview(labelOne)
        scrollView.addSubview(imageViewTwo)
        scrollView.addSubview(labelTwo)
        scrollView.addSubview(playButtonImageView)
        scrollView.addSubview(imageViewThree)
        scrollView.addSubview(labelThree)
        scrollView.addSubview(imageViewFour)
        scrollView.addSubview(labelFour)
        scrollView.addSubview(imageViewFive)
        scrollView.addSubview(labelFive)
        
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
        imageViewOne.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).inset(-26)
            make.leading.equalToSuperview().inset(8)
        }
        labelOne.snp.makeConstraints { make in
            make.leading.equalTo(imageViewOne.snp.trailing).inset(16)
            make.top.equalTo(imageViewOne).inset(29)
        }
        imageViewTwo.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            //make.leading.equalTo(imageViewOne)
            make.top.equalTo(labelOne.snp.bottom)
        }
        labelTwo.snp.makeConstraints { make in
            //make.leading.equalTo(labelOne)
            make.leading.equalTo(imageViewTwo.snp.trailing).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(imageViewTwo).inset(29)
        }
        playButtonImageView.snp.makeConstraints { make in
            make.top.equalTo(labelTwo.snp.bottom).inset(8)
            make.centerX.equalToSuperview()
        }
        imageViewThree.snp.makeConstraints { make in
            make.top.equalTo(playButtonImageView.snp.bottom).inset(29)
            //make.leading.equalTo(imageViewTwo)
            //make.leading.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
            //make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        labelThree.snp.makeConstraints { make in
            make.leading.equalTo(imageViewTwo.snp.trailing).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(imageViewThree).inset(29)
        }
        //labelThree.sizeToFit()
//        imageViewFour.snp.makeConstraints { make in
//            make.leading.equalTo(imageViewOne)
//            make.top.equalTo(labelThree)
//        }
//        labelFour.snp.makeConstraints { make in
//            make.top.equalTo(imageViewFour).inset(29)
//            make.leading.equalTo(labelOne)
//            make.trailing.equalTo(labelTwo)
//        }
    }
}
