//
//  ViewController.swift
//  WebBrowser
//
//  Created by programming-xcode on 11/25/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var urlField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(_ sender: Any) {
        let url = URL(string: urlField.text!)
        let urlreq = URLRequest(url: url!)
        webView.loadRequest(urlreq)
    }

}

