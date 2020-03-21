//
//  AttributesDescription.swift
//  LS_Miroshnichenko
//
//  Created by Мирошниченко Марина on 03.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class AttributesDescription: CustomStringConvertible {
    
    var description: String {
        return "\(creationDate?.description ?? "Unkhown date")     \(fileSize?.description ?? "Unknow size")"
    }
    
    var creationDate: Date?
    var fileSize: UInt?
    
    init(attributes: [FileAttributeKey : Any]) {
        creationDate = attributes[FileAttributeKey.creationDate] as? Date
        fileSize = attributes[FileAttributeKey.size] as? UInt
    }
}
