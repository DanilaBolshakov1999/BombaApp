//
//  RulesVCViewController.swift
//  Bomba-Challenge1
//
//  Created by admin on 08.08.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var rulesLabel: UILabel = {
        let rulesLabel = UILabel()
        rulesLabel.font = UIFont.systemFont(ofSize: 32,weight: .semibold)
        rulesLabel.textColor = .purpleText
        rulesLabel.textAlignment = .center
        rulesLabel.text = "Game Rules"
        return rulesLabel
    }()
    
    private lazy var firstRuleImage: UIImageView = {
        let ruleImage = UIImageView()
        ruleImage.contentMode = .scaleToFill
        ruleImage.clipsToBounds
        ruleImage.image = UIImage(named: "question1")
        return ruleImage
    }()
    
    private lazy var firstRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Все игроки становятся в круг."
        return label
    }()
    
    private lazy var scndRuleImage: UIImageView = {
        let ruleImage = UIImageView()
        ruleImage.contentMode = .scaleToFill
        ruleImage.image = UIImage(named: "question1")
        return ruleImage
    }()
    
    private lazy var scndRuleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Первый игрок берет телефон и нажимает кнопку:"
        return label
    }()
    
    private func configureUI() {
        guard let backgroundImage = UIImage(named: "backgroundImage") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
        view.addSubview(scrollView)
        
        // Add UI Elements to scrollView
        
        scrollView.addSubview(rulesLabel)
        
        // first rule
        scrollView.addSubview(firstRuleImage)
        scrollView.addSubview(firstRuleLabel)
        
        // second rule
        scrollView.addSubview(scndRuleImage)
        scrollView.addSubview(scndRuleLabel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
        
        rulesLabel.frame = CGRect(x: scrollView.frame.minX, y: scrollView.frame.minY + 8, width: view.frame.width, height: 96)
        
        // First rule
        firstRuleImage.frame = CGRect(x: 16,
                                      y: rulesLabel.frame.maxY + 26,
                                      width: 29,
                                      height: 29)
        firstRuleLabel.frame = CGRect(x: firstRuleImage.frame.maxX + 8,
                                      y: firstRuleImage.frame.origin.y,
                                      width: scrollView.frame.width - 32 - 16,
                                      height: 21)
        
        // second rule
        scndRuleImage.frame = CGRect(x: 16,
                                      y: firstRuleImage.frame.maxY + 26,
                                      width: 29,
                                      height: 29)
        scndRuleLabel.frame = CGRect(x: scndRuleImage.frame.maxX + 8,
                                      y: scndRuleImage.frame.origin.y,
                                      width: scrollView.frame.width - 32 - 16,
                                      height: 21)
    }
}

struct Model {
    let ruleImage: String
    let ruleText: String
}
