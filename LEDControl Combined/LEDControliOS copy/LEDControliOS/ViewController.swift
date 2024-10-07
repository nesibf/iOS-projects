//
//  ViewController.swift
//  LEDControliOS
//
//  Created by programming-xcode on 11/19/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LEDOn(_ sender: Any) {
        let url = URL(string: "http://192.168.1.112/ledon")
        let urlreq = URLRequest(url: url!)
        webView.loadRequest(urlreq)
    }
    
    @IBAction func LEDOff(_ sender: Any) {
        let url = URL(string: "http://192.168.1.112/ledoff")
        let urlreq = URLRequest(url: url!)
        webView.loadRequest(urlreq)
    }

}

