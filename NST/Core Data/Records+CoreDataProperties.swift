//
//  Records+CoreDataProperties.swift
//  NST
//
//  Created by TIAN TONG on 10/8/20.
//
//

import Foundation
import CoreData


extension Records {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Records> {
        return NSFetchRequest<Records>(entityName: "Records")
    }

    @NSManaged public var startedAt: Date
    @NSManaged public var count: Int64

}

extension Records : Identifiable {

}
