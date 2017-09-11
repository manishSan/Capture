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

    let capture = Capture()
    override func viewDidLoad() {
        super.viewDidLoad()
        capture.clear()
        addLogs()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showLogs(_ sender: Any) {
        let nv = capture.getUI()
        self.present(nv, animated: true, completion: nil)
    }

    private func addLogs() {
        capture.saveEntry(name: "First Log", details: nil)
        capture.saveEntry(name: "Second Log", details: [("a key", "a small value"), ("2 key", "a long value"), ("3 key", "a mdeium value"),("4 key", "a ver large value")])
    }
}

