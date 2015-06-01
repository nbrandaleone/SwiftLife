//
//  WorldView.swift
//  SwiftLife
//
//  Created by Nick Brandaleone on 6/1/15.
//  Copyright (c) 2015 Nick Brandaleone. All rights reserved.
//

import UIKit

// A UIView subclass that renders the Game of Life 'World'
class WorldView: UIView {
    
    let world: World
    
    init(world: World) {
        self.world = world
        super.init(frame: CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        func fillColorForCell (state: State) -> UIColor {
            switch state {
            case .Alive:
                return UIColor.blueColor()
            case .Dead:
                return UIColor.lightGrayColor()
            case .NeverLived:
                return UIColor.whiteColor()
            }
        }
        
        func frameForCell (cell: Cell) -> CGRect {
            let dimensions = CGFloat(self.world.dimensions)
            let cellSize = CGSizeMake(self.bounds.width / dimensions, self.bounds.height / dimensions)
            return CGRectMake(CGFloat(cell.x) * cellSize.width,
                CGFloat(cell.y) * cellSize.height,
                cellSize.width, cellSize.height)
        }
        
        for cell in world.cells {
            CGContextSetFillColorWithColor(context, fillColorForCell(cell.state).CGColor)
            CGContextAddRect(context, frameForCell(cell))
            CGContextFillPath(context)
        }
    }
}
