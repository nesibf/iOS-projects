//
//  ViewController.swift
//  TempHumReaderiOS
//
//  Created by programming-xcode on 11/21/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tempHumLabel: UILabel!
    @IBOutlet var webView: UIWebView!
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.timerFunc), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func timerFunc() {
        print("Timer Fired")
        let url = URL(string: "http://192.168.1.112/read")
        let urlreq = URLRequest(url: url!)
        webView.loadRequest(urlreq)
        tempHumLabel.text = webView.stringByEvaluatingJavaScript(from: "document.body.innerText")
    }

}

