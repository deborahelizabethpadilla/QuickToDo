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
    
    var timer = Timer()
    var timeLeft = 600
    
    //Outlets

    @IBOutlet var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Actions

    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
        let seconds = 600
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        timeLeft = 600
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerViewController.timerRunning), userInfo: nil, repeats: true)
    }
    
    func timerRunning() {
        
        timeLeft -= 1
        timerLabel.text = "Time Left: \(timeLeft)"
        
        if timeLeft == 0 {
            
            timer.invalidate()
            timerLabel.text = "Times Up!"
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", minutes, seconds)
    }
   
}
