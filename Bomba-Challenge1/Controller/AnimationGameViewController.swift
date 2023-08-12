//
//  AnimationGameViewController.swift
//  Bomba-Challenge1
//
//  Created by Danila Bolshakov on 10.08.2023.
//

import UIKit
import AVFoundation

final class AnimationGameViewController: UIViewController {
  
  // MARK: - Private Property
  private lazy var backgroundView: GradientView = {
    let gradientView = GradientView(frame: .zero)
    return gradientView
  }()
  
  private lazy var questionLabel: UILabel = {
    let questionLabel = UILabel()
    questionLabel.text = "В следующем раунде после каждого ответа хлопать в ладоши"
    questionLabel.numberOfLines = 0
    questionLabel.textColor = UIColor.purpleText
    questionLabel.textAlignment = .center
    questionLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    return questionLabel
  }()
  
  private lazy var animationImage: UIImageView = {
    let animationImage = UIImageView()
    animationImage.animationImages = animatedImages(for: "Unknown-")
    animationImage.contentMode = .scaleAspectFill
    animationImage.animationDuration = 1.5
    animationImage.image = animationImage.animationImages?.first
    return animationImage
  }()
  
  private var player: AVAudioPlayer?
  
  private var timer: Timer?
  private var timeLeft = 5
  
  // MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    animationImage.startAnimating()
  }
  
  // Action Methods
  @objc
  private func addTappedBack() {
    if timer?.isValid ?? false {
      print("wow")
    } else {
      navigationController?.popViewController(animated: true)
    }
  }
  
  @objc
  private func addTappedPause() {
    if (timer?.isValid ?? false) {
      timer?.invalidate()
      player?.stop()
      animationImage.stopAnimating()
    } else {
      configureTimer()
      player?.play()
      animationImage.startAnimating()
    }
  }
  
  @objc
  private func onTimerFires() {
    timeLeft -= 1
    print(timeLeft)
    
    if timeLeft == 1 {
      animationImage.animationImages = animatedImages(for: "Unknown-4-")
      animationImage.startAnimating()
      configurePlayer(urlName: "BOOM")
    }
    
    if timeLeft <= 0 {
      timer?.invalidate()
     
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.player?.stop()
        let gameEndViewController = GameEndViewController()
        self.navigationController?.pushViewController(gameEndViewController, animated: true)
      }
    }
  }
}

// MARK: - Setting Views
private extension AnimationGameViewController {
  func setupView() {
    view.backgroundColor = .white
    addSubviews()
    setupLayout()
    configureNavController()
    randomTimer()
    configureTimer()
    configurePlayer(urlName: "NOK")
  }
  
}

// MARK: - Setting
private extension AnimationGameViewController {
  func addSubviews() {
    view.addSubview(backgroundView)
    view.addSubview(questionLabel)
    view.addSubview(animationImage)
  }
  
  func configureNavController() {
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
  
  func animatedImages(for name: String) -> [UIImage] {
    var i = 0
    var images = [UIImage]()
    
    while let image = UIImage(named: "\(name)\(i)") {
      images.append(image)
      i += 1
    }
    return images
  }
  
  func randomTimer() {
    let random = Int.random(in: 1...15)
    timeLeft += random
  }
  
  func configureTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
  }
  
  func configurePlayer(urlName: String) {
    guard let url = Bundle.main.url(forResource: urlName, withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      
      player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      guard let player = player else { return }
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
}

private extension AnimationGameViewController {
  func setupLayout() {
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    animationImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      
      questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      animationImage.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 150),
      animationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      animationImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
}



