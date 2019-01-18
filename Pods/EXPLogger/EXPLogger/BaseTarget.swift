//
//  Destination.swift
//  EXPLogger
//
//  Created by Alex Tereshkov on 8/20/17.
//  Copyright © 2017 Alex Tereshkov. All rights reserved.
//

import Foundation

public class BaseTarget: Hashable {
    
    // custom log message for target
    public struct LogTag {
        public var verbose = "[VERBOSE]"
        public var debug = "[DEBUG]"
        public var info = "[INFO]"
        public var warning = "[WARNING]"
        public var error = "[ERROR]"
        public var critical = "[CRITICAL]"
    }
    
    // custom color for target
    public struct LogColor {
        public var verbose = ""
        public var debug = ""
        public var info = ""
        public var warning = ""
        public var error = ""
        public var critical = ""
    }
    
    // MARK: Options
    
    /// Don't log messages which are below this level
    open var minLogLevel = EXPLogger.LogLevel.verbose
    
    /// Option: whether or not to output the date the log was created
    open var showDate: Bool = true
    
    /// Option: whether or not to output the log identifier
    open var showLogTag: Bool = true
    
    /// Option: whether or not to output the fileName that generated the log
    open var showFileName: Bool = true
    
    /// Option: whether or not to output the function name that generated the log
    open var showFunctionName: Bool = true
    
    /// Option: whether or not to output the thread's name the log was created on. NOTE: Doesn't work now. // TODO
    open var showThreadName: Bool = false
    
    /// Option: whether or not to output the line number where the log was generated
    open var showLineNumber: Bool = true
    
    /// Option: whether or not to output the log level of the log
    open var showLevel: Bool = true
    
    /// Option: whether or not to output the file suffix (e.g. .swift)
    open var showFileSuffix: Bool = false
    
    /// Option: whether or not to enable coloring output
    open var enableColors: Bool = false
    
    /// Option: date format for log. Default is "HH:mm:ss.SSS"
    open var defaultDateFormat = "HH:mm:ss.SSS"
    
    /// Option: time zone. Default is "Current"
    open var defaultTimeZone = "" // empty = TimeZone.Current by default
    
    // MARK: Helper properties
    
    // custom output of log tag (info, debug, etc) for target
    open var logTag = LogTag()
    
    // custom color for target
    open var logColor = LogColor()
    var reset = ""
    var escape = ""
    
    private let dateFormatter = DateFormatter()
    
    // each target class must have an own hashValue
    lazy public var hashValue: Int = self.defaultHashValue
    open var defaultHashValue: Int { return 0 }
    
    open func send(_ level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) {
        
    }
    
    // base formatting for all targets
    func formatMessage(level: EXPLogger.LogLevel, msg: String, thread: String, file: String, function: String, line: Int) -> String {
        // todo add formatting
        var log = ""
        
        if showDate {
            log += formatDate() + " "
        }
        if showLogTag {
            log += escape + color(for: level)
            log += tag(for: level) + reset + " "
        }
        
        log += "["
        
        if showFileName {
            log += fileName(of: file, withoutSuffix: !showFileSuffix) + "."
        }
        if showFunctionName {
            log += function
        }
        
        log += ":"
        
        if showLineNumber {
            log += String(line)
        }
        
        log += "]"
        log += " - " + msg
        
        // TODO add thread name
        
        return log
    }
    
    // MARK: Help
    
    func tag(for level: EXPLogger.LogLevel) -> String {
        switch level {
        case EXPLogger.LogLevel.verbose:
            return logTag.verbose
        case EXPLogger.LogLevel.debug:
            return logTag.debug
        case EXPLogger.LogLevel.info:
            return logTag.info
        case EXPLogger.LogLevel.warning:
            return logTag.warning
        case EXPLogger.LogLevel.error:
            return logTag.error
        case EXPLogger.LogLevel.critical:
            return logTag.critical
        }
    }
    
    func color(for level: EXPLogger.LogLevel) -> String {
        switch level {
        case EXPLogger.LogLevel.verbose:
            return logColor.verbose
        case EXPLogger.LogLevel.debug:
            return logColor.debug
        case EXPLogger.LogLevel.info:
            return logColor.info
        case EXPLogger.LogLevel.warning:
            return logColor.warning
        case EXPLogger.LogLevel.error:
            return logColor.error
        case EXPLogger.LogLevel.critical:
            return logColor.critical
        }
    }
    
    func formatDate(_ dateFormat: String = "", timeZone: String = "") -> String {
        dateFormatter.dateFormat = dateFormat.isEmpty ? defaultDateFormat : dateFormat
        dateFormatter.timeZone = timeZone.isEmpty ? TimeZone.current : TimeZone(abbreviation: timeZone)
        
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    func fileName(of file: String, withoutSuffix: Bool) -> String {
        var filename = ""
        
        let fileParts = file.components(separatedBy: "/")
        if let lastPart = fileParts.last {
            filename = lastPart
        }
        
        if !filename.isEmpty && withoutSuffix {
            let fileNameParts = filename.components(separatedBy: ".")
            if let firstPart = fileNameParts.first {
                filename = firstPart
            }
        }
        
        return filename
    }
    
}

public func == (lhs: BaseTarget, rhs: BaseTarget) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
