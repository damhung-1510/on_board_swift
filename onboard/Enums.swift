//
//  Enums.swift
//  onboard
//
//  Created by admin on 03/04/2024.
//

import Foundation
import UIKit

enum OBStep {
    case step1
    case step2
    case start
    
    func isStart() -> Bool {return self == .start}
    
    func getImage() -> String {
        switch(self){
            case .step1:
                return "OnBoardStep1"
            case .step2:
                return "OnBoardStep2"
            case .start:
                return "OnBoardStart"
        }
    }
    
    func getCurrentPage() -> Int {
        switch(self){
            case .step1:
                return 0
            case .step2:
                return 1
            case .start:
                return 2
        }
    }
    
    func getTitle() -> String {
        switch(self){
            case .step1:
                return "Track your work and get the result"
            case .step2:
                return "Stay organized with team "
            case .start:
                return "Get notified when work happens"
        }
    }
    
    func getSubTitle() -> String {
        switch(self){
            case .step1:
                return "Remember to keep track of your professional accomplishments."
            case .step2:
                return "But understanding the contributions our colleagues make to our teams and companies"
            case .start:
                return "Take control of notifications, collaborate live or on your own time"
        }
    }
    
    func getBackgroundColor() -> UIColor {
        switch(self){
            case .step1:
                return UIColor(red: 218/255, green: 211/255, blue: 200/255, alpha: 1)
            case .step2:
                return UIColor(red: 255/255, green: 229/255, blue: 222/255, alpha: 1)
            case .start:
                return UIColor(red: 220/255, green: 246/255, blue: 230/255, alpha: 1)
        }
    }
}
