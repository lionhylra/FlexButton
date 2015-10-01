//
//    FlexButton.swift
//    The MIT License (MIT)
//
//    Copyright (c) 2015 Yilei He
//    https://github.com/lionhylra/FlexButton
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import UIKit

enum FlexButtonLayoutStyle {
    case DefaultLayout
    case HorizonLayoutTitleLeftImageRight
    case VerticalLayoutTitleDownImageUp
    case VerticalLayoutTitleUpImageDown
}

class FlexButton: UIButton {

    var layoutStyle:FlexButtonLayoutStyle = .DefaultLayout
    private var boundsCenter: CGPoint {
        return CGPoint(x: self.bounds.origin.x + self.bounds.size.width/2,
                       y: self.bounds.origin.y + self.bounds.size.height/2)
    }
    
    override convenience init(frame: CGRect){
        self.init(layoutStyle:.DefaultLayout, frame: frame)
    }
    
    
    init(layoutStyle style:FlexButtonLayoutStyle, frame: CGRect = CGRectZero){
        self.layoutStyle = style
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        guard let imageView = self.imageView, label = self.titleLabel else { return }

        switch layoutStyle {
        case .DefaultLayout:
            return
        case .HorizonLayoutTitleLeftImageRight:
            
            let totalWidth = label.frame.width + imageView.frame.width
            
            label.frame.origin.x = self.boundsCenter.x - totalWidth/2
            imageView.frame.origin.x = label.frame.origin.x + label.frame.width
            
        case .VerticalLayoutTitleDownImageUp:
            
            adjustSubviewSizeForVerticalLayoutStyle(label: label, imageView: imageView)
            
            let totalHeight = label.frame.height + imageView.frame.height
            
            /* adjust position */
            imageView.frame.origin.y = self.boundsCenter.y - totalHeight/2
            imageView.center.x = self.boundsCenter.x
            
            /* adjust position */
            label.frame.origin.y = imageView.frame.origin.y + imageView.frame.height
            label.center.x = self.boundsCenter.x
            
        case .VerticalLayoutTitleUpImageDown:
            
            adjustSubviewSizeForVerticalLayoutStyle(label: label, imageView: imageView)
            let totalHeight = label.frame.height + imageView.frame.height
            
            /*  adjust position */
            label.frame.origin.y = self.boundsCenter.y - totalHeight/2
            label.center.x = self.boundsCenter.x
            
            /* adjust position */
            imageView.frame.origin.y = label.frame.origin.y + label.frame.height
            imageView.center.x = self.boundsCenter.x
        }
        
    }

    private func adjustSubviewSizeForVerticalLayoutStyle(label label: UILabel, imageView: UIImageView) {
        /* adjust label  size */
        label.sizeToFit()
        if label.frame.size.width > self.bounds.size.width {
            label.frame.size.width = self.bounds.size.width
        }
        
        /* adjust imageView size */
        if imageView.frame.size.height > self.bounds.size.height - label.frame.size.height {
            imageView.frame.size.height = self.bounds.size.height - label.frame.size.height
        }
        if imageView.frame.size.width > self.bounds.size.width {
            imageView.frame.size.width = self.bounds.size.width
        }

    }
}
