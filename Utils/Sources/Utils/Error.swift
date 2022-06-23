//
//  Error.swift
//
//  Created by dDomovoj on 6/14/22.
//

import Foundation

extension Swift.String: LocalizedError {

  public var errorDescription: String? { self }

}

public func fatalError<T>(_ message: @autoclosure () -> String = #function, file: StaticString = #file, line: UInt = #line) -> T {
  Swift.fatalError(message(), file: file, line: line)
}

public func preconditionFailure<T>(_ message: @autoclosure () -> String = #function) -> T {
  Swift.preconditionFailure(message())
}
