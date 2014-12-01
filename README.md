iOS-Shaped-Button-Swift
=======================

UIButton subclass which will intercept and fire actions only when the user taps on a portion of the button that has an alpha. 

In the following screen there are 3 UIButtons that are "overlapping". Normally (as views are always rects) the biggest or the frontmost button would "steal" all the touches from the other buttons. Using SOXShapedTapButton class the user touch will be intercepted only in the "circular" area of the clocks.

![alt tag](https://github.com/spagosx/iOS-Shaped-Button-Swift/blob/master/screen1.png)


**How to use it:**

You can initialise it as any traditional UIButton and add it to your view. 

    let button = SOXShapedTapButton()
    button.setBackgroundImage(UIImage(named: "tower_clock"), forState: .Normal)
    // assign frame and add it to view ...

Or you can easily add a UIButton instance to a xib and set the class to SOXShapedTapButton.

**Properties**
The class has only one property named `treshold` which is the minimum value the alpha channel of your button has to exceed in order for the touch to be accepted, the default value is `1.0` which is full alpha. 
`treshold` is a `IBInspectable` property, so you can edit the value directly from Interface Builder.

**Approach**

The approach I've chosen is identical to the one used in <a href="https://github.com/spagosx/ColorFromPointImageView">here</a> where we get the pixel data from the touch point and we access the RGBA values, in this case we read `A` and check if it is higher than our treshold.

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

