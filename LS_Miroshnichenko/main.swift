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

if userArguments.count < 2 {
    clHelper.output(outputText: "parameter is not defined, open help with parameter \"-h\"", outputType: .error)
    exit(0)
}

if userArguments.contains("-h") {
    clHelper.help()
    exit(0)
}

let fileManager = FileManager.default
let currenDirectoryPath = fileManager.currentDirectoryPath
let shouldSkipHiddenFiles = !userArguments.contains("-a")

guard let urls = fileManager.urls(for: currenDirectoryPath, skipsHiddenFiles: shouldSkipHiddenFiles) else {
    exit(0)
}

let shouldPrintAttributes = userArguments.contains("-l")

if shouldPrintAttributes {
    for url in urls {
        clHelper.output(outputText: "\(AttributesDescription(attributes: url.attributes))   \(url.relativePath)", outputType: .message)
    }
} else {
    for url in urls {
        clHelper.output(outputText: "\(url.relativePath)", outputType: .message)
    }
}
