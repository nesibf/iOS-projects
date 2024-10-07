//
//  ViewController.swift
//  SmartLampiOS
//
//  Created by programming-xcode on 11/22/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lampButton: UIButton!
    @IBOutlet var webView: UIWebView!
    
    var lampStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()
        lampButton.setTitle("Turn Lamp On", for: UIControlState())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func lampToggle(_ sender: Any) {
        if lampStatus == false {
            let url = URL(string: "http://192.168.1.112/ledon")
            let urlreq = URLRequest(url: url!)
            webView.loadRequest(urlreq)
            lampButton.setTitle("Turn Lamp Off", for: UIControlState())
            lampStatus = true
        } else if lampStatus == true {
            let url = URL(string: "http://192.168.1.112/ledoff")
            let urlreq = URLRequest(url: url!)
            webView.loadRequest(urlreq)
            lampButton.setTitle("Turn Lamp On", for: UIControlState())
            lampStatus = false
        }
    }

}

