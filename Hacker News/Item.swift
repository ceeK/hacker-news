//
//  Item.swift
//  Hacker News
//
//  Created by Chris Howell on 17/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation
import ObjectMapper

enum ItemType: String {
    case Comment = "comment"
    case Story = "story"
}

class Item: Mappable {
    var identifier: Int!
    var by: User!
    var time: NSDate!
    var itemType: ItemType!
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        identifier <- map["id"]
        by <- map["by"]
        time <- (map["time"], DateTransform())
        itemType <- map["type"]
    }
}