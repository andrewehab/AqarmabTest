//
//  GradientView.swift
//  TestRxSwift
//
//  Created by AnDy on 24/07/2021.
//

import UIKit

@IBDesignable
public class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var startPointX: CGFloat = 0 {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var startPointY: CGFloat = 0 {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var endPointX: CGFloat = 1 {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable
    var endPointY: CGFloat = 0 {
        didSet {
            setGradient()
        }
    }
    
    
    @IBInspectable
    var roundRadius: Bool = false {
        didSet {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: frame.width / 2, height: frame.height / 2))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

    
    private func setGradient() {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            gradientLayer.frame = bounds
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
            gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            
            layer.insertSublayer(gradientLayer, at: 0)
            
        } else {
            gradientLayer.removeFromSuperlayer()
        }
    }
    
}
