//
//  FlexButton.swift
//  MyJeylabs
//
//  Created by HeYilei on 29/09/2015.
//  Copyright © 2015 HeYilei. All rights reserved.
//

import UIKit

enum FlexButtonLayoutStyle {
    case DefaultLayout
    case HorizonLayoutTitleLeftImageRight
    case VerticalLayoutTitleDownImageUp
    case VerticalLayoutTitleUpImageDown
}

class FlexButton: UIButton {

    var layoutStyle:FlexButtonLayoutStyle = .DefaultLayout
    
    convenience init(layoutStyle style:FlexButtonLayoutStyle){
        self.init()
        self.layoutStyle = style
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        switch layoutStyle {
        case .DefaultLayout:
            return
        case .HorizonLayoutTitleLeftImageRight:
            let labelWidth = self.titleLabel?.frame.size.width
            let imageViewWidth = self.imageView?.frame.size.width
            let totalWidth = (labelWidth ?? 0) + (imageViewWidth ?? 0)
            if let label = self.titleLabel {
                label.frame.origin.x = self.center.x - totalWidth/2
            }
            if let imageView = self.imageView {
                guard let label = self.titleLabel else {return}
                imageView.frame.origin.x = label.frame.origin.x + label.frame.width
            }
        case .VerticalLayoutTitleDownImageUp:
            let labelHeight = self.titleLabel?.frame.height
            let imageViewHeight = self.imageView?.frame.height
            let totalHeight = (labelHeight ?? 0) + (imageViewHeight ?? 0)
            if let imageView = self.imageView {
                imageView.frame.origin.y = self.center.y - totalHeight/2
                imageView.center.x = self.center.x
            }
            
            if let label = self.titleLabel {
                guard let imageView = self.imageView else {return}
                label.frame.origin.y = imageView.frame.origin.y + imageView.frame.height
                label.center.x = self.center.x
            }
        case .VerticalLayoutTitleUpImageDown:
            let labelHeight = self.titleLabel?.frame.height
            let imageViewHeight = self.imageView?.frame.height
            let totalHeight = (labelHeight ?? 0) + (imageViewHeight ?? 0)
            if let label = self.titleLabel {
                label.frame.origin.y = self.center.y - totalHeight/2
                label.center.x = self.center.x
            }
            
            if let imageView = self.imageView {
                guard let label = self.titleLabel else {return}
                imageView.frame.origin.y = label.frame.origin.y + label.frame.height
                imageView.center.x = self.center.x
            }
        }
        
    }

}
