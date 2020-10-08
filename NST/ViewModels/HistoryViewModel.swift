//
//  HistoryViewModel.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import Foundation

class HistoryViewModel {
    
    let context = CoreDataManager.shared.viewContext
    
    var records = [Records]()
    
    func loadHistotry(completion: @escaping () -> Void) {
        if let objects = CoreDataOperation.queryObjects(entityName: "Records", context: context) as? [Records] {
            records = objects
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
}
