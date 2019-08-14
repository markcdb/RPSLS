//
//  CircularProgress.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 14/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import UIKit

class CircularProgress: UIView {

    let shapeLayer       = CAShapeLayer()
    let secondShapeLayer = CAShapeLayer()
    var circularPath: UIBezierPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Frame: \(self.frame)")
        makeCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeCircle()
    }
    
    func makeCircle(){
        circularPath = UIBezierPath(arcCenter: .zero,
                                    radius: self.bounds.width / 2,
                                    startAngle: 0,
                                    endAngle: 2 * CGFloat.pi,
                                    clockwise: true)
        shapeLayer.path = circularPath?.cgPath
        shapeLayer.strokeColor = UIColor.darkGray.withAlphaComponent(0.9).cgColor
        shapeLayer.lineWidth = 5.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        shapeLayer.position = self.center
        shapeLayer.transform = CATransform3DRotate(CATransform3DIdentity, -CGFloat.pi / 2, 0, 0, 1)
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func animateInSeconds(_ seconds: Double,
                          label: UILabel?,
                          completion: @escaping (() -> Void)){
        var buffer: Double = 1
        label?.text = String(Int(seconds))
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1,
                                         repeats: true) { timer in
                                            if seconds == buffer {
                                                timer.invalidate()
                                            }
                                            
                                            label?.text = String(Int(seconds - buffer))
                                            let percent = (buffer * (100/seconds))/100
                                            self.shapeLayer.strokeEnd = CGFloat(percent)
                                            buffer += 1
                                            
                                            if (seconds - buffer) == 2 {
                                                //Trigger completion when timer
                                                //is almost done
                                                completion()
                                            }
        }
        
        timer.fire()
    }
}
