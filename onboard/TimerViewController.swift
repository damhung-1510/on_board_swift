//
//  TimerViewController.swift
//  onboard
//
//  Created by admin on 03/04/2024.
//

import Foundation
import UIKit


class TimerViewController: UIViewController {
    
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 120
    var timeLeftOrigin: TimeInterval = 120
    var endTime: Date?
    var timer = Timer()
    // here you create your basic animation object to animate the strokeEnd
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    var isStartingTimer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBgShape()
        drawTimeLeftShape()
        timeLabel.text = timeLeft.time
        resetBtn.layer.cornerRadius = 12
        resetBtn.layer.borderWidth = 3
        resetBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func onTappedStartBtn(_ sender: Any) {
        isStartingTimer.toggle()
        if timeLeft != timeLeftOrigin && isStartingTimer == true {
            startBtn.setTitle("Pause", for: .normal)
            endTime = Date().addingTimeInterval(timeLeft)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            _resumeAnimation()
            return
        }
        if isStartingTimer {
            startBtn.setTitle("Pause", for: .normal)
            endTime = Date().addingTimeInterval(timeLeft)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            strokeIt.fromValue = 1
            strokeIt.toValue = 0
            strokeIt.duration = timeLeft
            timeLeftShapeLayer.add(strokeIt, forKey: "strokeEnd")
        } else {
            
            _pauseAnimation()
            startBtn.setTitle("Continue", for: .normal)
            timer.invalidate()
        }
        
    }
    
    func _pauseAnimation(){
        let pausedTime = timeLeftShapeLayer.convertTime(CACurrentMediaTime(), from: nil)
        timeLeftShapeLayer.speed = 0.0
        timeLeftShapeLayer.timeOffset = pausedTime
    }
    
    func _resumeAnimation(){
        let pausedTime = timeLeftShapeLayer.timeOffset
        timeLeftShapeLayer.speed = 1.0
        timeLeftShapeLayer.timeOffset = 0.0
        timeLeftShapeLayer.beginTime = 0.0
        let timeSincePause = timeLeftShapeLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        timeLeftShapeLayer.beginTime = timeSincePause
    }
    
    func _resetAnimation(){
        /// Backward Animation
        strokeIt.fromValue = timeLeft/timeLeftOrigin
        strokeIt.toValue = 1
        strokeIt.duration = 0.5
        
        /// resume for case:  pause --> reset
        _resumeAnimation()
        
        /// override animation
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.timeLeftShapeLayer.speed = 1.0
            self.timeLeftShapeLayer.removeAllAnimations()
        }
        
        
    }
    
    @IBAction func onTappedResetBtn(_ sender: Any) {
        _resetAnimation()
        _ressetData()
    }
    
    
    func _ressetData(){
        timer.invalidate()
        timeLeft = timeLeftOrigin
        timeLabel.text = timeLeft.time
        timeLabel.layoutIfNeeded()
        isStartingTimer = false
        startBtn.setTitle("Start", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func drawBgShape() {
        bgShapeLayer.path = UIBezierPath(arcCenter:  CGPoint(x: self.timerView.frame.width / 2  , y: self.timerView.frame.height / 2), radius:
                                            self.timerView.frame.width / 2, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.darkGray.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 8
        bgShapeLayer.frame = self.timerView.bounds
        timerView.layer.addSublayer(bgShapeLayer)
    }
    
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.timerView.frame.width / 2  , y: self.timerView.frame.height / 2), radius:
                                                self.timerView.frame.width / 2, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.frame = self.timerView.bounds
        timeLeftShapeLayer.strokeColor = UIColor.orange.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 8
        //        self.timerView.layer.mask = timeLeftShapeLayer
        timerView.layer.addSublayer(timeLeftShapeLayer)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft.time
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()
        }
        timeLabel.layoutIfNeeded()
    }
}

