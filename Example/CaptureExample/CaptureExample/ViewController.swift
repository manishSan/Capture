//
//  ViewController.swift
//  CaptureExample
//
//  Created by Sanwal, Manish on 9/11/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import UIKit
import Capture

class ViewController: UIViewController {

    let capture = Capture(
    override func viewDidLoad() {
        super.viewDidLoad()
        try capture.saveEntry(name: String, details: [(String, String)]?)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

