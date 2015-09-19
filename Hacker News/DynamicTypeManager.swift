//
//  DynamicTypeManager.swift
//  Hacker News
//
//  Created by Chris Howell on 19/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation

class DynamicTypeManager {
    static var sharedInstance: DynamicTypeManager = {
       return DynamicTypeManager()
    }()
    
    private init() {
        
    }
}