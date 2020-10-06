//
//  MainViewController.swift
//  NST
//
//  Created by TIAN TONG on 10/6/20.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Property
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let historyButton = UIBarButtonItem(title: "History", style: .done, target: self, action: #selector(handleHistory))
        navigationItem.rightBarButtonItem = historyButton
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    // MARK: - Method
    
    lazy var tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+ 1", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 50
        return button
    }()
    
    func setupViews() {
        view.addSubview(tapButton)
        view.addConstraints(format: "H:[v0(100)]", views: tapButton)
        view.addConstraints(format: "V:[v0(100)]", views: tapButton)
        tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    
    // MARK: - Action
    
    @objc func handleHistory() {
        print("Here")
    }
    
    @objc func handleTap() {
        count += 1
        print(count)
    }

}
