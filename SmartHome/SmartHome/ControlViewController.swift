//
//  ControlViewController.swift
//  SmartHome
//
//  Created by programming-xcode on 11/22/17.
//  Copyright © 2017 programming-xcode. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    
    @IBOutlet var controlledRoomLabel: UILabel!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var tempHumLabel: UILabel!
    @IBOutlet var webView: UIWebView!
    @IBOutlet var webView2: UIWebView!
    @IBOutlet var lampButton: UIButton!
    var lampStatus = false
    
    var timer = Timer()
    
    var roomString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ControlViewController.tempHumFunc), userInfo: nil, repeats: true)
        controlledRoomLabel.text = roomString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func controlChanged(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            lampButton.isHidden = false
            tempHumLabel.isHidden = true
            timer.invalidate()
            break
        case 1:
            lampButton.isHidden = true
            tempHumLabel.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ControlViewController.tempHumFunc), userInfo: nil, repeats: true)
            break
        default:
            break
        }
    }
    
    @IBAction func lampToggled(_ sender: Any) {
        if lampStatus == false {
            lampButton.setTitle("Turn Lamp Off", for: UIControlState())
            let url = URL(string: "http://192.168.1.112/ledon")
            let urlreq = URLRequest(url: url!)
            webView.loadRequest(urlreq)
            lampStatus = true
        } else if lampStatus == true {
            lampButton.setTitle("Turn Lamp On", for: UIControlState())
            let url = URL(string: "http://192.168.1.112/ledoff")
            let urlreq = URLRequest(url: url!)
            webView.loadRequest(urlreq)
            lampStatus = false
        }
    }
    
    @objc func tempHumFunc() {
        print("Timer Fired")
        let url = URL(string: "http://192.168.1.112/read")
        let urlreq = URLRequest(url: url!)
        webView2.loadRequest(urlreq)
        tempHumLabel.text = webView2.stringByEvaluatingJavaScript(from: "document.body.innerText")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
