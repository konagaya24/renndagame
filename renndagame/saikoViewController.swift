//
//  saikoViewController.swift
//  renndagame
//
//  Created by 古長谷鷹念 on 2019/08/24.
//  Copyright © 2019 古長谷鷹念. All rights reserved.
//

import UIKit

class saikouViewController: UIViewController {
    
    var timer : Timer!
    var timer1 = Timer()
    var startTime1: TimeInterval = 0
    var time1 : Double = 0.0
    var flag : Bool = true
    
    var hp : Int = 30
    @IBOutlet var label : UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet var clearImageView : UIImageView!
    @IBOutlet var stoneImageView : UIImageView!
    @IBOutlet var tugi : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
        clearImageView.isHidden = true
        tugi.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func plus() {
        if hp >= 3{
            hp = hp - 3
            if(flag) {
                startTime1 = Date().timeIntervalSince1970
                timer1 = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(self.timerupdate), userInfo: nil, repeats: true)
                flag = false
            }
            label.text = String(hp)
        }
    }
    @objc func timerupdate() {
        time1 = Date().timeIntervalSince1970 - startTime1
        let sec = Int(time1)
        let msec = Int((time1 - Double(sec)) * 100)
        let displayStr = NSString(format: "%02d:%02d.%02d", sec/60, sec%60, msec) as String
        labelTimer.text = displayStr
    }
    @IBAction func restart(){
        hp = 30
        clearImageView.isHidden = true
        tugi.isHidden = true
        label.text = String(hp)
        timer1.invalidate()
        labelTimer.text = "00:00.00"
        flag = true
    }
    
    @objc func update(tm: Timer) {
        
        
        if hp >= 30 {
            label.text = String(hp)
        }else if(hp <= 0){
            clearImageView.isHidden = false
            tugi.isHidden = false
            label.text = "0"
            print("表示")
            timer1.invalidate()
            
            
        }else{
            hp = hp + 8
            label.text = String(hp)
        }
        
    }
}

