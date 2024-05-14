//
//  ViewController.swift
//  onboard
//
//  Created by admin on 03/04/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicator: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    var currentOBStep: OBStep!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _changeOBStep(step: OBStep.step1)
        nextBtn.layer.cornerRadius = 24
        nextBtn.layer.masksToBounds = true
        startBtn.layer.cornerRadius = 24
        startBtn.layer.masksToBounds = true
    }
    
    @IBAction func onTappedSkipBtn(_ sender: Any) {
//        _handleSkipAction()
    }
    
    @IBAction func onTappedStartBtn(_ sender: Any) {
//        _handleStartAction()
        let targetScreen = storyboard?.instantiateViewController(identifier: "TimerViewController") as? TimerViewController
        self.navigationController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(targetScreen!, animated: true)
    }
    
    @IBAction func onTappedNextBtn(_ sender: Any) {
        
        switch(currentOBStep){
            
        case .step1:
            _handleNextStep2Action()
            break
        case .step2:
            _handleNextStartAction()
            break
        case .start:
            break
            
        case .none:
            break
        }
    }
    
    func _handleNextStep2Action(){
        _changeOBStep(step: OBStep.step2)
    }
    
    func _handleNextStartAction(){
        _changeOBStep(step: OBStep.start)
    }
    
    func _handleSkipAction(){
        _changeOBStep(step: OBStep.start)
    }
    
    func _handleStartAction(){
        _changeOBStep(step: OBStep.step1)
    }
    
    func _changeOBStep(step: OBStep){
        self.currentOBStep = step
        UIView.animate(withDuration: 0.5) {
            self.indicator.currentPage = self.currentOBStep.getCurrentPage()
            self.view.backgroundColor = self.currentOBStep.getBackgroundColor()
            self.titleLabel.text = self.currentOBStep.getTitle()
            self.subTitle.text = self.currentOBStep.getSubTitle()
            self.imageView.image = UIImage(named: self.currentOBStep.getImage())
            if step.isStart() {
                self.nextBtn.isHidden = true
                self.skipBtn.isHidden = true
                self.startBtn.isHidden = false
            } else {
                self.nextBtn.isHidden = false
                self.skipBtn.isHidden = false
                self.startBtn.isHidden = true
            }
        }
        
    }
    
}

