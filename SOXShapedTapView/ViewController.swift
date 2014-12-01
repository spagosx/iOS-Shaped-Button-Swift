//
//  ViewController.swift
//  SOXShapedTapView
//
//  Created by Spagnolo, Daniele on 30/11/2014.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = SOXShapedTapButton()
        button.setBackgroundImage(UIImage(named: "tower_clock"), forState: .Normal)
        // assign frame and add it to view ...
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        NSLog("button tapped")
    }
}

