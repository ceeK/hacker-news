//
//  UIFont+App.swift
//  Hacker News
//
//  Created by Chris Howell on 16/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit

extension UIFont {
    public class func appPrimaryFont() -> UIFont {
        guard let font = UIFont(name: "Avenir-Medium", size: 12.0) else {
            fatalError("Avenir-Medium font cannot be loaded")
        }
        
        return font
    }
}