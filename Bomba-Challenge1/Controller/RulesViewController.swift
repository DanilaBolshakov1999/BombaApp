//
//  RulesVCViewController.swift
//  Bomba-Challenge1
//
//  Created by admin on 08.08.2023.
//

import UIKit

final class RulesViewController: UIViewController {
    
    // говорили про скролл вью, но я решил пойти дальше.
    /*
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
     */
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: Configure base UI
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let backgroundImage = UIImage(named: "backgroundImage") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
}

extension RulesViewController: UITableViewDataSource, UITableViewDelegate {
    
}
