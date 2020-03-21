//
//  Extensions.swift
//  LS_Miroshnichenko
//
//  Created by Мирошниченко Марина on 03.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

// include hidden files
extension FileManager {
    func urls(for directory: String, skipsHiddenFiles: Bool = true ) -> [URL]? {
        return try? contentsOfDirectory(at: URL(fileURLWithPath: directory), includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [] )
    }

    func fileAttributes(filePath path: String) -> [FileAttributeKey : Any]? {
        do {
            return try attributesOfItem(atPath: path)
        } catch let error as NSError {
            print("FileAttribute error: \(error)")
        }
        return nil
    }
}
