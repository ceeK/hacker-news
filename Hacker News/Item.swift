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

class Item: Mappable, CustomStringConvertible {
    var identifier: Int!
    var by: String!
    var kids: [Faultable<Item>] = []
    var time: NSDate!
    var itemType: ItemType!
    
    var description: String {
        get {
            guard let string = Mapper().toJSONString(self, prettyPrint: true) else {
                return "\(identifier)"
            }
            
            return string
        }
    }
    
    
    // MARK: Mappable
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        identifier <- map["id"]
        by <- map["by"]
        time <- (map["time"], DateTransform())
        itemType <- map["type"]
    }
    
    // MARK: Public methods
    
    func fetchKids() {
        for item in kids {
            item.fetch()
        }
    }
}

extension Item: Fetchable {
    func fetch() {
        
    }
}