//
//  Trilean - Yes, No, Maybe
//  Three-valued logic for Swift
//  Trilean.swift
//
//  Copyright (c) 2014-2015 @phelgo. MIT licensed to you.
//

private enum TrileanValue {
    case Yes, No, Maybe
}

public struct Trilean: BooleanType, BooleanLiteralConvertible, Equatable, Printable {
    private var value = TrileanValue.Maybe
    
    private init(_ trileanValue: TrileanValue) {
        value = trileanValue
    }
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value ? .Yes : .No
    }
    
    public var boolValue: Bool {
        switch value {
        case .Yes:
            return true
        default:
            return false
        }
    }
    
    public var description: String {
        switch value {
        case .Yes:
            return "yes"
        case .No:
            return "no"
        default:
            return "maybe"
        }
    }
    
    public var optimistically: Trilean {
        return self == maybe ? yes : self
    }
}

public let yes = Trilean(.Yes)
public let no = Trilean(.No)
public let maybe = Trilean(.Maybe)

public func ==(lhs: Trilean, rhs: Trilean) -> Bool {
    return lhs.value == rhs.value
}

public func &&(lhs: Trilean, rhs: Trilean) -> Trilean {
    if lhs == no || rhs == no {
        return no
    }
    else if lhs == maybe || rhs == maybe {
        return maybe
    }
    else {
        return yes
    }
}

public func ||(lhs: Trilean, rhs: Trilean) -> Trilean {
    if lhs == yes || rhs == yes {
        return yes
    }
    else if lhs == maybe || rhs == maybe {
        return maybe
    }
    else {
        return no
    }
}

public prefix func !(trilean: Trilean) -> Trilean {
    if trilean == yes {
        return no
    }
    else if trilean == no {
        return yes
    }
    else {
        return maybe
    }
}

public func sure(trilean: Trilean, closure: () -> ()) {
    if trilean == yes {
        closure()
    }
}

public func sureNot(trilean: Trilean, closure: () -> ()) {
    if trilean == no {
        closure()
    }
}

public func unsure(trilean: Trilean, closure: () -> ()) {
    if trilean == maybe {
        closure()
    }
}
