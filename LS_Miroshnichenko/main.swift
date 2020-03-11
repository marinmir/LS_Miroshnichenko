//
//  main.swift
//  LS_Miroshnichenko
//
//  Created by Мирошниченко Марина on 02.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

let clHelper = CommandLineIOHelper()

var userArguments = clHelper.input()
userArguments.remove(at: 0)
var lsArguments = userArguments.map {
    LsArguments(rawValue: $0)
}

if userArguments.count < 2 {
    clHelper.output(outputText: "parameter is not defined, open help with parameter \"-h\"", outputType: .error)
    exit(0)
}

if lsArguments.contains(.h) {
    clHelper.help()
    exit(0)
}

let fileManager = FileManager.default
let currentDirectoryPath = fileManager.currentDirectoryPath
let shouldSkipHiddenFiles = !lsArguments.contains(.a)

guard let urls = fileManager.urls(for: currentDirectoryPath, skipsHiddenFiles: shouldSkipHiddenFiles) else {
    exit(0)
}

let shouldPrintAttributes = lsArguments.contains(.l)

for url in urls {
    let attributes = AttributesDescription(attributes: fileManager.fileAttributes(filePath: url.absoluteString) ?? [:])
    
    let text = shouldPrintAttributes ? "\(attributes)   \(url.relativePath)" :
                                       "\(url.relativePath)"
    clHelper.output(outputText: text, outputType: .message)
}

