//
//  SOXShapedTapView.swift
//  SOXShapedTapView
//
//  Created by Spagnolo, Daniele on 30/11/2014.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

extension UIView {
    func alphaFromPoint(point: CGPoint) -> CGFloat {
        var pixel: [UInt8] = [0, 0, 0, 0]
        let colorSpace = CGColorSpaceCreateDeviceRGB();
        let alphaInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedLast.rawValue)
        let context = CGBitmapContextCreate(&pixel, 1, 1, 8, 4, colorSpace, alphaInfo)
        
        CGContextTranslateCTM(context, -point.x, -point.y);
        
        self.layer.renderInContext(context)
        
        let floatAlpha = CGFloat(pixel[3])
        return floatAlpha
    }
}

@IBDesignable
class SOXShapedTapButton: UIButton {
    
    @IBInspectable var treshold: CGFloat = 1.0 {
        didSet {
            if treshold > 1.0 {
                treshold = 1.0
            }
            if treshold < 0.0 {
                treshold = 0.0
            }
        }
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return self.alphaFromPoint(point) > treshold
    }
}