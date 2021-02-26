//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Kyrylo Hanichev on 23.02.2021.
//  Copyright © 2021 CodeIt_LLC. All rights reserved.
//

import Foundation
import CoreData

extension Article {

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: Data?
    @NSManaged public var creationDate: Date?
    @NSManaged public var modificationDate: Date?
}
