//
//  Extension.swift
//  onboard
//
//  Created by admin on 03/04/2024.
//

import Foundation
import UIKit

extension TimeInterval {
    var time:String {
        if self <= 60 {
            return String(format: "%02d", Int(floor(self/60)))
        } else
        {
            return String(format: "%01d:%02d", Int(self/60), Int(ceil(truncatingRemainder(dividingBy: 60))))
        }
    }
}

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

extension UIView {
    func setAnchorPoint(anchorPoint: CGPoint) {
        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x,
                               y: self.bounds.size.height * anchorPoint.y)


        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x,
                               y: self.bounds.size.height * self.layer.anchorPoint.y)

        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)

        var position = self.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        self.layer.position = position
        self.layer.anchorPoint = anchorPoint
    }
}
