//
//  UIViewExtention.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//


import UIKit

@IBDesignable
extension UIView {
    
    // MARK: Corner Radius
    @IBInspectable var CornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    // MARK: Border Width
    @IBInspectable var BorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // MARK: Border Color
    @IBInspectable var BorderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    
    // MARK: Shadow Color
    @IBInspectable var ShadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.masksToBounds = false
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
    // MARK: Shadow Opacity
    @IBInspectable var ShadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    
    // MARK: Shadow Offset
    @IBInspectable var ShadowOffset: CGPoint {
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        
    }
    
    
    // MARK: Shadow Blur
    @IBInspectable var ShadowBlur: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue / 2.0
        }
    }
    
    
    // MARK: Bottom Corner Radius
    @IBInspectable var BottomCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            setRoundedCorners([.bottomLeft, .bottomRight], radius: newValue)
        }
    }
    
    
    // MARK: Top Corner Radius
    @IBInspectable var TopCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            setRoundedCorners([.topLeft, .topRight], radius: newValue)
        }
    }
    
    
    // MARK: Top Corner Radius
    private func setRoundedCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
    // MARK: Top Corner Radius
    func loadXibView(with xibFrame: CGRect) -> UIView {
        let className = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: className, bundle: bundle)
        guard let xibView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()
        }
        
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        xibView.frame = xibFrame
        return xibView
    }
    
}
