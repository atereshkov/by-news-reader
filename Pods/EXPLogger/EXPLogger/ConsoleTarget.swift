//
//  ConsoleTarget.swift
//  EXPLogger
//
//  Created by Alex Tereshkov on 8/20/17.
//  Copyright © 2017 Alex Tereshkov. All rights reserved.
//

import Foundation

public class ConsoleTarget: BaseTarget {
    
    override public var defaultHashValue: Int { return 1 }
    
    public override init() {
        super.init()
        
        // setting up colors
        /*
        reset = "\u{001B}[0m"
        escape = "\u{001B}[0;"
        logColor.verbose = "251m"
        logColor.debug = "35m"
        logColor.info = "38m"
        logColor.warning = "178m"
        logColor.error = "197m"
        logColor.critical = "35m"
        */
        
        if enableColors {
            logColor.verbose = ""
            logColor.debug = "➡ "
            logColor.info = "❕ "
            logColor.warning = "⚡ "
            logColor.error = "❗ "
            logColor.critical = "❌ "
        }
    }
    
    override public func send(_ level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) {
        let formattedLog = formatMessage(level: level, msg: msg, thread: thread, file: file, function: function, line: line)
        
        Swift.print(formattedLog)
    }
    
}
