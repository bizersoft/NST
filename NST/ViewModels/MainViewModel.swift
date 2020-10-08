//
//  MainViewModel.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//

import Foundation

class MainViewModel {
    
    let context = CoreDataManager.shared.viewContext

    var tap = Dynamic(0)
    var count = Dynamic(0)
    var timer = Dynamic(Config.timer)
    var start = Dynamic(Config.start)
    var trackButton = Dynamic(Config.beginButton)
    
    var previous = Date()
    
    var countDown: Timer?
    var minutes = Config.minutes
    var seconds = Config.seconds
    
    var isNew = true
    var isEnd = false
    
    var startedAt: Date?
    
    func trackTap() {
        if isEnd {
            reset()
            return
        }
        
        tap.value += 1
        
        let current = Date()
        if isNew {
            startedAt = current
            trackButton.value = Config.countButton
            count.value += 1
            start.value = current.shortString
            previous = current
            
            countDown = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            isNew = false
        } else {
            let interval = previous.distance(to: current)
            
            if interval > Config.countInterval {
                count.value += 1
                previous = current
            }
        }
    }
    
    private func saveRecord() {
        let record = Records(context: context)
        record.startedAt = Date()
        record.count = Int64(count.value)
        
        CoreDataManager.shared.saveContext()
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        if seconds == -1 {
            minutes -= 1
            seconds = 59
        }
        if minutes == -1  {
            countComplete()
            return
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        timer.value = minutesString + ":" + secondsString
    }
    
    private func countComplete() {
        countDown?.invalidate()
        countDown = nil
        isEnd = true
        trackButton.value = Config.resetButton
        
        let record = Records(context: context)
        record.count = Int64(count.value)
        record.startedAt = startedAt ?? Date()
        
        CoreDataManager.shared.saveContext()
    }
    
    private func reset() {
        minutes = Config.minutes
        seconds = Config.seconds
        count.value = 0
        tap.value = 0
        previous = Date(timeIntervalSince1970: 0)
        
        start.value = Config.start
        trackButton.value = Config.beginButton
        timer.value = Config.timer
        isNew = true
        isEnd = false
        
        startedAt = nil
    }
    
}
