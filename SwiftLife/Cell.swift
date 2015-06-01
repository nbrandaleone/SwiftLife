//
//  Cell.swift
//  SwiftLife
//
//  Created by Nick Brandaleone on 6/1/15.
//  Copyright (c) 2015 Nick Brandaleone. All rights reserved.
//

// A single cell within the Game of Life
class Cell: Hashable {
    let x: Int, y: Int
    var state: State
    var neighbours: [Cell]
    
    var hashValue: Int {
        return x + y * 1_000;
    }
    
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
        state = .Dead
        neighbours = [Cell]()
    }
}

func == (lhs: Cell, rhs: Cell) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

enum State {
    case Alive, Dead, NeverLived
}
