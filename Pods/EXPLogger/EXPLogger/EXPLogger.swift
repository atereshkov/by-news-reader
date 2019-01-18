//
//  LogManager.swift
//  EXPLogger
//
//  Created by Alex Tereshkov on 8/18/17.
//  Copyright © 2017 Alex Tereshkov. All rights reserved.
//

import Foundation

public class EXPLogger {
    
    // MARK: Log Level
    
    public enum LogLevel: Int {
        case verbose = 0
        case debug = 1
        case info = 2
        case warning = 3
        case error = 4
        case critical = 5
    }
    
    // MARK: Log Target
    
    public private(set) static var targets = Set<BaseTarget>()
    
    public class func addTarget(_ target: BaseTarget) {
        if !targets.contains(target) {
            targets.insert(target)
        }
    }
    
    public class func removeTarget(_ target: BaseTarget) {
        if targets.contains(target) {
            targets.remove(target)
        }
    }
    
    public class func removeAllTargets() {
        targets.removeAll()
    }
    
    // MARK: Log
    
    // lowest priority
    open class func verbose(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .verbose, message: closure, file: file, function: function, line: line)
    }
    
    // low priority
    open class func debug(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .debug, message: closure, file: file, function: function, line: line)
    }
    
    // normal priority
    open class func info(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .info, message: closure, file: file, function: function, line: line)
    }
    
    // high priority
    open class func warning(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .warning, message: closure, file: file, function: function, line: line)
    }
    
    // highest priority
    open class func error(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .error, message: closure, file: file, function: function, line: line)
    }
    
    // critical priority
    open class func critical(_ closure: @autoclosure () -> Any?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        perfom(level: .critical, message: closure, file: file, function: function, line: line)
    }
    
    public class func perfom(level: EXPLogger.LogLevel, message: () -> Any?, file: String = #file, function: String = #function, line: Int = #line) {
        guard let closure = message() else { return }
        let message = String(describing: closure)
        send(level: level, message: message, thread: threadName(), file: file, function: function, line: line)
    }
    
    // send log to target
    class func send(level: EXPLogger.LogLevel, message: String, thread: String, file: String, function: String, line: Int) {
        for target in targets {
            // todo add queue to the targets and dispatchQueue
            target.send(level, msg: message, thread: thread, file: file, function: function, line: line)
        }
    }
    
    class func threadName() -> String {
        if Thread.isMainThread {
            return ""
        } else {
            if let threadName = Thread.current.name, !threadName.isEmpty {
                return threadName
            } else {
                return String(format: "%p", Thread.current)
            }
        }
    }
    
}
