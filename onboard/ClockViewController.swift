//
//  ClockViewController.swift
//  onboard
//
//  Created by admin on 04/04/2024.
//

import Foundation

import UIKit


class ClockViewController: UIViewController {
    
    @IBOutlet weak var hourHand1: UIView!
    @IBOutlet weak var minuteHand1: UIView!
    @IBOutlet weak var secondHand1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       a()
        
        
    }
    func a(){
        let degrees : Double = 90;
        print(hourHand1.layer.anchorPoint.x)
        print(hourHand1.layer.anchorPoint.y)
        var t = CGAffineTransform.identity
//        t = t.translatedBy(x: view.bounds.width/2, y: view.bounds.height/2)
        t = t.rotated(by: CGFloat(degrees * .pi/180))
        hourHand1.transform = t
        hourHand1.layoutIfNeeded()
//        t = t.scaledBy(x: -1, y: 2)
//        hourHand1.layer.anchorPoint = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
//                hourHand1.setAnchorPoint(anchorPoint: CGPoint(x: view.bounds.width/2, y: view.bounds.height/2))
//        hourHand1.transform = CGAffineTransform(rotationAngle: CGFloat(degrees * .pi/180))
        print(hourHand1.layer.anchorPoint.x)
        print(hourHand1.layer.anchorPoint.y)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

    }
    

    
}
