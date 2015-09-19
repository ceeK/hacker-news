//
//  User.swift
//  Hacker News
//
//  Created by Chris Howell on 18/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var identifier: Int!
    var name: String!
    var created: NSDate!
    var karma: Int!
    var submitted: [Story]!
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        identifier <- map["id"]
        name <- map["name"]
        created <- (map["created"], DateTransform())
        karma <- map["karma"]
        submitted <- map["submitted"]
    }
}

extension User: Fetchable {
    func fetch() {
        
    }
}
