//
//  MainViewModel.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import Foundation

class MainViewModel {
    
    let context = CoreDataManager.shared.viewContext

    var count = 0
    var tap = 0
    
    func countOne() {
        saveRecord()
    }
    
    private func saveRecord() {
        
        let record = Records(context: context)
        record.count = 5
        record.date = Date()
        
        CoreDataManager.shared.saveContext()
    }
    
}
