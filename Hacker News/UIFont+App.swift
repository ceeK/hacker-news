//
//  UIFont+App.swift
//  Hacker News
//
//  Created by Chris Howell on 16/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit

extension UIFont {
    public class func appPrimaryFont(ofSize size: CGFloat = 16.0) -> UIFont {
        guard let font = UIFont(name: "Avenir-Medium", size: size) else {
            fatalError("Avenir-Medium font cannot be loaded")
        }
        
        return font
    }
}