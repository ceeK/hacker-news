//
//  Comment.swift
//  Hacker News
//
//  Created by Chris Howell on 17/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation
import ObjectMapper

class Comment: Item {
    var parent: Faultable<Comment>!
    var kids: [Faultable<Comment>] = []
    var text: String!
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        parent <- (map["parent"], FaultableTransformer<Comment>())
        kids <- (map["kids"], FaultableTransformer<Comment>())
        text <- map["text"]
    }
}

extension Comment: Fetchable {
    func fetch() {
        // TODO: Model -> Networking code
    }
}
