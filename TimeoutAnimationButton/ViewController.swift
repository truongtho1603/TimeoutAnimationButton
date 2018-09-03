//
//  ViewController.swift
//  TimeoutAnimationButton
//
//  Created by Thomas Do on 01/09/2018.
//  Copyright © 2018 Tho Do. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawHighlight()
    }

    func drawHighlight() {
        playButton.layer.masksToBounds = false

        let backgroundPath = UIBezierPath(roundedRect: playButton.bounds.insetBy(dx: -5.0, dy: -5.0), cornerRadius: 25)
        let backgroundPathLayer = CAShapeLayer()
        backgroundPathLayer.strokeStart = 0.0
        backgroundPathLayer.strokeEnd = 1.0
        backgroundPathLayer.strokeColor = UIColor.cyan.cgColor
        backgroundPathLayer.fillColor = UIColor.clear.cgColor
        backgroundPathLayer.lineWidth = 10.0
        backgroundPathLayer.path = backgroundPath.cgPath
        playButton.layer.addSublayer(backgroundPathLayer)

        let foregroundPath = UIBezierPath(roundedRect: playButton.bounds.insetBy(dx: -5.0, dy: -5.0), cornerRadius: 25)
        let highlightLayer = CAShapeLayer()
        highlightLayer.strokeStart = 1.0
        highlightLayer.strokeEnd = 1.0
        highlightLayer.strokeColor = UIColor.yellow.cgColor// view.backgroundColor?.cgColor
        highlightLayer.fillColor = UIColor.clear.cgColor
        highlightLayer.lineWidth = 10.0
        highlightLayer.lineJoin = kCALineJoinRound
        highlightLayer.lineCap = kCALineCapButt
        highlightLayer.path = foregroundPath.cgPath

        let pathAnimation = CABasicAnimation()
        pathAnimation.keyPath = "strokeStart"
        pathAnimation.fromValue = highlightLayer.strokeStart
        pathAnimation.toValue = 0.0
        pathAnimation.duration = 3.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        pathAnimation.fillMode = kCAFillModeBoth
        pathAnimation.isRemovedOnCompletion = false

        highlightLayer.add(pathAnimation, forKey: nil)
        playButton.layer.addSublayer(highlightLayer)
    }
}

