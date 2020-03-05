//
//  CommandLineIOHelper.swift
//  LS_Miroshnichenko
//
//  Created by Мирошниченко Марина on 03.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//


import Foundation

enum OutputType {
    case message
    case error
}

enum  LsArguments: String {
    case h = "-h"
    case a = "-a"
    case l = "-l"
}

class CommandLineIOHelper {
        
    func input() -> [String] {
        return CommandLine.arguments
    }
    
    func output(outputText text: String, outputType type: OutputType) {
        switch type {
        case .message:
            print(text)
        case .error:
            fputs(text, stderr)
        }
    }
    
    func help() -> Void {
        print("""
        To use command "ls", enter the following characters:
        "-h" shows help information;
        "-a" shows files in current directory including hidden files;
        "-l" shows files additional information;
        """)
    }
}
