//
//  ViewController.swift
//  Stopwatch App
//
//  Created by Wren Liang on 2019-02-06.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var StackView: UIStackView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    
    
    
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }
    
    
    @objc func UpdateTimer(){
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    
    
}

