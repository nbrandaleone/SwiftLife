//
//  Util.swift
//  SwiftLife
//
//  Created by Nick Brandaleone on 6/1/15.
//  Copyright (c) 2015 Nick Brandaleone. All rights reserved.
//

// Some functional shortcuts
infix operator !~= {}

func !~= <I : IntervalType>(value: I.Bound, pattern: I) -> Bool {
    return !(pattern ~= value)
}

extension Array {
    func each<T>(fn: (T) -> ()) {
        for item in self {
            let itemAsT = item as! T
            fn(itemAsT)
        }
    }
}
