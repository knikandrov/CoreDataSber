//
//  Photo+CoreDataProperties.swift
//  CoreDataSber
//
//  Created by Konstantin Nikandrov on 29.11.2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var mediaURL: String?

}
