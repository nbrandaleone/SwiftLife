//
//  ViewController.swift
//  SwiftLife
//
//  Created by Nick Brandaleone on 6/1/15.
//  Copyright (c) 2015 Nick Brandaleone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let world = World()
    let worldView: WorldView
    var timer: NSTimer!
    
    // Randomly create 100 alive cells upon initialization
    required init(coder aDecoder: NSCoder) {
        
        worldView = WorldView(world: world)
        
        super.init(coder: aDecoder)
        
        // a random initial state
        func randLocation () -> Int {
            return Int(arc4random_uniform( UInt32( world.dimensions )))
        }
        for _ in 0...100 {
            let x = randLocation(), y = randLocation()
            world[x, y]!.state = .Alive
        }
    }
    
    // start toggle for game. Game updates 10 times per second
    func handleTap(recognizer: UITapGestureRecognizer) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.10, target: self, selector: "tick", userInfo: nil, repeats: true)
    }
    
    // determine who is alive/dead and update display
    func tick() {
        world.iterateNonOptimised()
        worldView.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margin: CGFloat = 20.0
        let size = view.frame.width - margin * 2.0
        var frame = CGRectMake(margin, (view.frame.height - size) / 2.0, size, size)
        worldView.frame = frame
        worldView.layer.borderColor = UIColor.darkGrayColor().CGColor
        worldView.layer.borderWidth = 2.0
        view.addSubview(worldView)
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        view.addGestureRecognizer(singleFingerTap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

