//
//  Trilean - Yes, No, Maybe
//  Three-valued logic for Swift
//  Trilean.swift
//
//  Copyright (c) 2014 @phelgo. MIT licensed to you.
//

private enum TrileanValue {
    case Yes, No, Maybe
}

struct Trilean: BooleanType, BooleanLiteralConvertible, Equatable, Printable {
    private var value = TrileanValue.Maybe
    private var optimistic = false;
    
    private init(_ trileanValue: TrileanValue) {
        value = trileanValue
    }
    
    static func convertFromBooleanLiteral(value: Bool) -> Trilean {
        return value ? Trilean(.Yes) : Trilean(.No)
    }
    
    var boolValue: Bool {
        switch (value, optimistic) {
        case (.Yes, _):
            return true
        case (.No, _):
            return false
        case (.Maybe, false):
            return false
        case (.Maybe, true):
            return true
        default:
            return true
        }
    }
    
    var description: String {
    switch value {
    case .Yes:
        return "yes"
    case .No:
        return "no"
    default:
        return "maybe"
        }
    }
    
    var optimistically: Trilean {
        var trilean = self
        trilean.optimistic = true
        return trilean
    }
}

let yes = Trilean(.Yes)
let no = Trilean(.No)
let maybe = Trilean(.Maybe)

func ==(lhs: Trilean, rhs: Trilean) -> Bool {
    return lhs.value == rhs.value
}

func &&(lhs: Trilean, rhs: Trilean) -> Trilean {
    if (lhs == no || rhs == no) {
        return no
    }
    else if (lhs == maybe || rhs == maybe) {
        return maybe
    }
    else {
        return yes
    }
}

func ||(lhs: Trilean, rhs: Trilean) -> Trilean {
    if (lhs == yes || rhs == yes) {
        return yes
    }
    else if (lhs == maybe || rhs == maybe) {
        return maybe
    }
    else {
        return no
    }
}

prefix func !(trilean: Trilean) -> Trilean {
    if (trilean == yes) {
        return no
    }
    else if (trilean == no) {
        return yes
    }
    else {
        return maybe
    }
}

func sure(trilean: Trilean, closure: () -> ()) {
    if(trilean == yes) {
        closure()
    }
}

func sureNot(trilean: Trilean, closure: () -> ()) {
    if(trilean == no) {
        closure()
    }
}

func unsure(trilean: Trilean, closure: () -> ()) {
    if(trilean == maybe) {
        closure()
    }
}
