//
//  TimerViewController.swift
//  QuickToDo
//
//  Created by Deborah on 6/9/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    //Variables
    
    var time = 0
    var timer = Timer()
    
    //Outlets

    @IBOutlet var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Actions

    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
        time = 0
        timerLabel.text = "0"
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
    }
    
    func action() {
        
        time += 1
        timerLabel.text = String(time)
    }
    
    
} // End Class
