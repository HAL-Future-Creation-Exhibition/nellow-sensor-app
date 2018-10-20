//
//  ViewController.swift
//  nellow-sensor-app
//
//  Created by 高鉾大貴 on 2018/10/18.
//  Copyright © 2018 高鉾大貴. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    let myDevice: UIDevice = UIDevice.current
    let flg: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDevice.isProximityMonitoringEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximitySensorStateDidChange), name: UIDevice.proximityStateDidChangeNotification, object: nil)
    }
    
    @objc func proximitySensorStateDidChange() {
        print(myDevice.proximityState)
        if myDevice.proximityState {
            label.text = "ちかずいたよ"
            Alamofire.request("https://ac31deed.ngrok.io/sleep", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        } else {
            label.text = "離れたよ"
            Alamofire.request("https://ac31deed.ngrok.io/wakeup", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        }
    }
    
    
    

}

