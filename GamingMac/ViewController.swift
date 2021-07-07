//
//  ViewController.swift
//  GamingMac
//
//  Created by p-x9 on 2021/07/07.
//  
//

import Cocoa

class ViewController: NSViewController {

    let shapeLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        
        shapeLayer.fillColor = NSColor.clear.cgColor
        shapeLayer.strokeColor = NSColor.black.cgColor
        shapeLayer.strokeStart = 0.0
        shapeLayer.strokeEnd = 0.0
        shapeLayer.lineWidth = 16.0
        view.layer?.addSublayer(shapeLayer)
        
        gradientLayer.colors = NSColor.rainbow()
        gradientLayer.frame = NSScreen.main!.frame
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.mask = shapeLayer
        view.layer?.addSublayer(gradientLayer)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        shapeLayer.path = CGPath.init(rect: NSScreen.main!.frame, transform: nil)
        gradientLayer.frame = NSScreen.main!.frame
        self.animate()
        
    }


    @objc func animate() {
        let animation1 = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        animation1.fromValue         = 0.0
        animation1.toValue           = 1.0
        animation1.duration          = 1.0
        
        animation1.beginTime = 0
        
        animation1.isRemovedOnCompletion = false
        animation1.fillMode = .forwards
        
        
        let animation2 = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        animation2.fromValue         = 0.0
        animation2.toValue           = 1.0
        animation2.duration          = 0.5
        animation2.beginTime = 1/*+CACurrentMediaTime()*/
        
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.repeatCount = .infinity
        //group.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        group.animations = [animation1,animation2]
        
        
        
        self.shapeLayer.add(group, forKey: "group-animation")
    }

}

