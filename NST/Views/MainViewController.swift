//
//  MainViewController.swift
//  NST
//
//  Created by TIAN TONG on 10/6/20.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Property
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let historyButton = UIBarButtonItem(title: Labels.History, style: .done, target: self, action: #selector(handleHistory))
        navigationItem.rightBarButtonItem = historyButton
        
        view.backgroundColor = .white
        
        setupViews()
    }
    
    // MARK: - View
    
    let naviLine = UIView()
    let bottomLine = UIView()
    
    func setupViews() {
        view.addSubview(naviLine)
        view.addConstraints(format: "H:|[v0]|", views: naviLine)
        view.addConstraints(format: "V:|-\(naviGap)-[v0]", views: naviLine)
        view.addSubview(bottomLine)
        view.addConstraints(format: "V:[v0]-\(bottomGap)-|", views: bottomLine)
        
        setupTopView()
        setupMiddleView()
        setupBottomView()
    }
    
    var topContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var totalCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 120, weight: .light)
        label.textColor = UIColor.hexRed
        return label
    }()
    
    func setupTopView() {
        view.addSubview(topContentView)
        view.addConstraints(format: "H:|[v0]|", views: topContentView)
        topContentView.topAnchor.constraint(equalTo: naviLine.topAnchor).isActive = true
        topContentView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        let countLabel = UILabel()
        countLabel.text = Labels.Count
        countLabel.textColor = .darkText
        countLabel.font = UIFont.systemFont(ofSize: 20)
        
        topContentView.addSubview(countLabel)
        topContentView.addConstraints(format: "H:|-20-[v0]", views: countLabel)
        topContentView.addConstraints(format: "V:|-40-[v0]", views: countLabel)
        
        topContentView.addSubview(totalCount)
        topContentView.addConstraints(format: "H:|-20-[v0]", views: totalCount)
        topContentView.addConstraints(format: "V:|-80-[v0]|", views: totalCount)
        totalCount.text = "\(viewModel.count)"
    }
    
    var middleContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var totalTap: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        return label
    }()
    
    var timer: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        label.text = "60:00"
        return label
    }()
    
    var startedAt: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        label.text = "--:--"
        return label
    }()
    
    func setupMiddleView() {
        view.addSubview(middleContentView)
        view.addConstraints(format: "H:|[v0]|", views: middleContentView)
        view.addConstraints(format: "V:[v0(140)]", views: middleContentView)
        middleContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let tapNumberLabel = UILabel()
        tapNumberLabel.text = Labels.TapNumber
        tapNumberLabel.textColor = .darkGray
        tapNumberLabel.font = UIFont.systemFont(ofSize: 18)
        
        let timerLabel = UILabel()
        timerLabel.text = Labels.Timer
        timerLabel.textColor = .darkGray
        timerLabel.font = UIFont.systemFont(ofSize: 18)
        
        let startedAtLabel = UILabel()
        startedAtLabel.text = Labels.StartedAt
        startedAtLabel.textColor = .darkGray
        startedAtLabel.font = UIFont.systemFont(ofSize: 18)
        
        middleContentView.addSubview(tapNumberLabel)
        middleContentView.addConstraints(format: "H:|-20-[v0]", views: tapNumberLabel)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: tapNumberLabel)
        
        middleContentView.addSubview(timerLabel)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: timerLabel)
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        middleContentView.addSubview(startedAtLabel)
        middleContentView.addConstraints(format: "H:[v0]-20-|", views: startedAtLabel)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: startedAtLabel)
        
        middleContentView.addSubview(totalTap)
        middleContentView.addConstraints(format: "H:|-20-[v0]", views: totalTap)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: totalTap)
        totalTap.text = "\(viewModel.tap)"
        
        middleContentView.addSubview(timer)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: timer)
        timer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        middleContentView.addSubview(startedAt)
        middleContentView.addConstraints(format: "H:[v0]-20-|", views: startedAt)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: startedAt)
    }
    
    var bottomContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+ 1", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.layer.borderWidth = 5.0
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 75
        return button
    }()
    
    func setupBottomView() {
        view.addSubview(bottomContentView)
        view.addConstraints(format: "H:|[v0]|", views: bottomContentView)
        bottomContentView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        bottomContentView.bottomAnchor.constraint(equalTo: bottomLine.bottomAnchor).isActive = true
        
        bottomContentView.addSubview(tapButton)
        bottomContentView.addConstraints(format: "H:[v0(150)]", views: tapButton)
        bottomContentView.addConstraints(format: "V:[v0(150)]", views: tapButton)
        tapButton.centerXAnchor.constraint(equalTo: bottomContentView.centerXAnchor).isActive = true
        tapButton.centerYAnchor.constraint(equalTo: bottomContentView.centerYAnchor, constant: -50).isActive = true
        
        let tipLabel = UILabel()
        tipLabel.text = Labels.Tip
        tipLabel.textColor = .darkGray
        tipLabel.font = UIFont.systemFont(ofSize: 18)
        
        bottomContentView.addSubview(tipLabel)
        bottomContentView.addConstraints(format: "V:[v0]-40-|", views: tipLabel)
        tipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // MARK: - Action
    
    @objc func handleHistory() {
        let historyViewController = HistoyViewController()
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    @objc func handleTap() {
        viewModel.count += 1
        print(viewModel.count)
        
        viewModel.countOne()
    }

}
