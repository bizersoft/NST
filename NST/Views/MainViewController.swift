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
        
        viewModel.tap.bindAndFire { tap in
            self.tapLabel.text = "\(tap)"
        }
        
        viewModel.count.bindAndFire { count in
            self.totalCount.text = "\(count)"
        }
        
        viewModel.timer.bindAndFire { timer in
            self.timerLabel.text = "\(timer)"
        }
        
        viewModel.start.bindAndFire { start in
            self.startLabel.text = "\(start)"
        }
        
        viewModel.trackButton.bindAndFire { title in
            self.tapButton.setTitle(title, for: .normal)
        }
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
        countLabel.text = Labels.CountTitle
        countLabel.textColor = .darkText
        countLabel.font = UIFont.systemFont(ofSize: 20)
        
        topContentView.addSubview(countLabel)
        topContentView.addConstraints(format: "H:|-20-[v0]", views: countLabel)
        topContentView.addConstraints(format: "V:|-40-[v0]", views: countLabel)
        
        topContentView.addSubview(totalCount)
        topContentView.addConstraints(format: "H:|-20-[v0]", views: totalCount)
        topContentView.addConstraints(format: "V:|-80-[v0]|", views: totalCount)
    }
    
    var middleContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var tapLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        return label
    }()
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        return label
    }()
    
    var startLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.textColor = UIColor.darkText
        return label
    }()
    
    func setupMiddleView() {
        view.addSubview(middleContentView)
        view.addConstraints(format: "H:|[v0]|", views: middleContentView)
        view.addConstraints(format: "V:[v0(140)]", views: middleContentView)
        middleContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let tapTitle = UILabel()
        tapTitle.text = Labels.TapTitle
        tapTitle.textColor = .darkGray
        tapTitle.font = UIFont.systemFont(ofSize: 18)
        
        let timerTitle = UILabel()
        timerTitle.text = Labels.TimerTitle
        timerTitle.textColor = .darkGray
        timerTitle.font = UIFont.systemFont(ofSize: 18)
        
        let startTitle = UILabel()
        startTitle.text = Labels.StartTitle
        startTitle.textColor = .darkGray
        startTitle.font = UIFont.systemFont(ofSize: 18)
        
        middleContentView.addSubview(tapTitle)
        middleContentView.addConstraints(format: "H:|-20-[v0]", views: tapTitle)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: tapTitle)
        
        middleContentView.addSubview(timerTitle)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: timerTitle)
        timerTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        middleContentView.addSubview(startTitle)
        middleContentView.addConstraints(format: "H:[v0]-20-|", views: startTitle)
        middleContentView.addConstraints(format: "V:|-20-[v0]", views: startTitle)
        
        middleContentView.addSubview(tapLabel)
        middleContentView.addConstraints(format: "H:|-20-[v0]", views: tapLabel)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: tapLabel)
        
        middleContentView.addSubview(timerLabel)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: timerLabel)
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        middleContentView.addSubview(startLabel)
        middleContentView.addConstraints(format: "H:[v0]-20-|", views: startLabel)
        middleContentView.addConstraints(format: "V:[v0]-40-|", views: startLabel)
    }
    
    var bottomContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tapButton: UIButton = {
        let button = UIButton(type: .system)
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
        
        let tipTitle = UILabel()
        tipTitle.text = Labels.TipTitle
        tipTitle.textColor = .darkGray
        tipTitle.font = UIFont.systemFont(ofSize: 18)
        
        bottomContentView.addSubview(tipTitle)
        bottomContentView.addConstraints(format: "V:[v0]-40-|", views: tipTitle)
        tipTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // MARK: - Action
    
    @objc func handleHistory() {
        let historyViewController = HistoyViewController()
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    @objc func handleTap() {
        viewModel.trackTap()
    }

}
