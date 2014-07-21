//
//  BorderedButton.swift
//  BorderedButton
//
//  Created by Eugene on 7/20/14.
//  Copyright (c) 2014 33Devs Consulting. All rights reserved.
//

import UIKit
import QuartzCore

class BorderedButton: UIButton {
    
    var circleLayer: CAShapeLayer = CAShapeLayer()
    var borderColor: UIColor = UIColor.whiteColor()

    init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)

        setupButton()
    }

    func setupButton() {
        self.borderColor = self.titleLabel.textColor
        
        self.circleLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        self.circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        var path: UIBezierPath
        if (self.frame.size.width == self.frame.size.height) {
            path = UIBezierPath(ovalInRect: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
        }
        else {
            path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8)
        }
        self.circleLayer.path = path.CGPath;

        self.circleLayer.strokeColor = self.borderColor.CGColor;
        self.circleLayer.lineWidth = 2.0;
        self.circleLayer.fillColor = nil;
        self.layer.insertSublayer(self.circleLayer, below: self.titleLabel.layer)
        
    }
    
    
    override var highlighted: Bool {
    get {
        return super.highlighted
    }

    set(isHighlighted) {
        if (isHighlighted) {
            self.circleLayer.fillColor = self.borderColor.CGColor
            self.titleLabel.textColor = UIColor.whiteColor()
        }
        else {
            self.circleLayer.fillColor = nil
            self.titleLabel.textColor = self.borderColor
        }
        
    }
    }

    override func setTitleColor(color: UIColor!, forState state: UIControlState) {
        super.setTitleColor(color, forState: state)
        
        self.borderColor = color
        self.circleLayer.borderColor = color.CGColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupButton()
    }
}

