//
//  HistoryViewController.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import UIKit

class HistoyViewController: UIViewController {
    
    // MARK: - Property
    
    var viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewModel.loadHistotry {
            self.historyTable.reloadData()
        }
        
        setupViews()
    }
    
    // MARK: - View
    
    lazy var historyTable: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.registerCell(HistoryTabelCell.self)
        return table
    }()
    
    func setupViews() {
        view.addSubview(historyTable)
        view.addConstraints(format: "H:|[v0]|", views: historyTable)
        view.addConstraints(format: "V:|[v0]|", views: historyTable)
    }
    
}

extension HistoyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as HistoryTabelCell
        let record = viewModel.records[indexPath.row]
        
        cell.textLabel?.text = "\(record.count)"
        cell.detailTextLabel?.text = record.startedAt.mediumShortString
        return cell
    }
    
    
}

class HistoryTabelCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        selectionStyle = .none
        let seperateLine = UIView()
        seperateLine.backgroundColor = .lightGray
        
        addSubview(seperateLine)
        addConstraints(format: "H:|-15-[v0]-15-|", views: seperateLine)
        addConstraints(format: "V:[v0(0.5)]|", views: seperateLine)
    }
    
}
