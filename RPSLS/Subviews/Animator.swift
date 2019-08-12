//
//  Animator.swift
//  RPSLS
//
//  Created by Mark Christian Buot on 12/08/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import Foundation
import UIKit

enum Animation {
    case top
    case left
    case right
    case bottom
}


class Animator {
    
    typealias ViewAnimation = (view: UIView?, animation: Animation?, frame: CGRect?)

    var duration: Double                  = 0.8
    var dampingRatio: CGFloat             = 0.8
    var springVelocity: CGFloat           = 0.8
    private var animates: [ViewAnimation] = []
    
    func enqueue(_ view: UIView?,
                 animation: Animation) {
        
        view?.alpha        = 0
        let bufferedFrame = view?.frame
        let maxX          = bufferedFrame?.maxX ?? 0
        let maxY          = bufferedFrame?.maxY ?? 0
        let minX          = bufferedFrame?.minX ?? 0
        let minY          = bufferedFrame?.minY ?? 0
        let width         = bufferedFrame?.width ?? 0
        let height        = bufferedFrame?.height ?? 0
        
        switch animation {
        case .top:
            view?.frame = CGRect(x: minX,
                                y: -(maxY * 2),
                                width: width,
                                height: height)
        case .left:
            view?.frame = CGRect(x: -(maxX * 2),
                                y: minY,
                                width: width,
                                height: height)
        case .right:
            view?.frame = CGRect(x: maxX * 2,
                                y: minY,
                                width: width,
                                height: height)
        default:
            view?.frame = CGRect(x: minX,
                                y: maxY * 2,
                                width: width,
                                height: height)
        }
        
        animates.insert((view, animation, bufferedFrame),
                        at: 0)
    }
    
    func dequeue() -> ViewAnimation {
        
       return animates.removeLast()
    }
    
    func performAndDequeue() {
        
        perform(dequeue())
    }
    
    func performSequence() {
        animates.forEach { (view, animation, frame) in
            perform((view, animation, frame))
        }
    }
}

//MARK: - UIView Animations
extension Animator {

    func perform(_ viewAnimation: ViewAnimation) {
        let animation = viewAnimation.animation
        let view      = viewAnimation.view
        let frame     = viewAnimation.frame
        
        switch animation {
        case .top?:
            performTop(view,
                       frame: frame)
        case .left?:
            performLeft(view,
                        frame: frame)
        case .right?:
            performRight(view,
                         frame: frame)
        case .bottom?:
            performBottom(view,
                          frame: frame)
        default:
            break
        }
    }
    
    func performTop(_ view: UIView?,
                    frame: CGRect?) {
        animateWithAnimations({[weak view] in
            view?.alpha   = 1
            view?.frame = frame ?? .zero
        }) { isCompleted in
            
        }
    }
    
    func performLeft(_ view: UIView?,
                     frame: CGRect?) {
        animateWithAnimations({[weak view] in
            view?.alpha   = 1
            view?.frame = frame ?? .zero
        }) { isCompleted in
            
        }
    }
    
    func performRight(_ view: UIView?,
                      frame: CGRect?) {
        animateWithAnimations({[weak view] in
            view?.alpha   = 1
            view?.frame = frame ?? .zero
        }) { isCompleted in
            
        }
    }
    
    func performBottom(_ view: UIView?,
                       frame: CGRect?) {
        animateWithAnimations({[weak view] in
            view?.alpha   = 1
            view?.frame = frame ?? .zero
        }) { isCompleted in
            
        }
    }
    
    func animateWithAnimations(_ animations: @escaping (() -> Void),
                               completion: @escaping ((Bool) -> Void)) {
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: dampingRatio,
                       initialSpringVelocity: springVelocity,
                       options: .curveEaseOut,
                       animations: animations,
                       completion: completion)
    }
}
