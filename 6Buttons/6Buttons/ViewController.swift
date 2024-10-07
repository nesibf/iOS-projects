//
//  ViewController.swift
//  6Buttons
//
//  Created by programming-xcode on 11/10/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func B1(_ sender: Any) {
        var alert = UIAlertView(title: "Hi", message: "Button 1 was tapped", delegate: self, cancelButtonTitle: "OK")
        alert.show()
    }
    @IBAction func B2(_ sender: Any) {
        print("Button 2 tapped. ")
    }
    @IBAction func B3(_ sender: Any) {
        print("Button 3 tapped. ")
    }
    @IBAction func B4(_ sender: Any) {
        var alert = UIAlertView(title: "Hi", message: "Button 4 was tapped", delegate: self, cancelButtonTitle: "OK")
        alert.show()
    }
    @IBAction func B5(_ sender: Any) {
        var alert = UIAlertView(title: "Hi", message: "Button 5 was tapped", delegate: self, cancelButtonTitle: "OK")
        alert.show()
    }
    @IBAction func B6(_ sender: Any) {
        print("Button 6 tapped. ")
    }
}

