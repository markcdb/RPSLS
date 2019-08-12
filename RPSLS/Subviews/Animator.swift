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
    case fromTop
    case fromLeft
    case fromRight
    case fromBottom
}


class Animator {
    
    typealias ViewAnimation = (view: UIView?, animation: Animation?, frame: CGRect?)

    var duration: Double                  = 0.8
    var dampingRatio: CGFloat             = 0.8
    var springVelocity: CGFloat           = 0.8
    var option: UIView.AnimationOptions   = .curveEaseOut
    
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
        case .fromTop:
            view?.frame = CGRect(x: minX,
                                y: -(maxY * 2),
                                width: width,
                                height: height)
        case .fromLeft:
            view?.frame = CGRect(x: -(maxX * 2),
                                y: minY,
                                width: width,
                                height: height)
        case .fromRight:
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
        animates.forEach { _, _, _ in
            perform(dequeue())
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
        case .fromTop?:
            performTop(view,
                       frame: frame)
        case .fromLeft?:
            performLeft(view,
                        frame: frame)
        case .fromRight?:
            performRight(view,
                         frame: frame)
        case .fromBottom?:
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
                       options: option,
                       animations: animations,
                       completion: completion)
    }
}
