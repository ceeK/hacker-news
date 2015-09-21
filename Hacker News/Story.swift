//
//  Story.swift
//  Hacker News
//
//  Created by Chris Howell on 17/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation
import ObjectMapper

class Story: Item {
    var commentCount: Int!
    var score: Int!
    var title: String!
    var url: NSURL!
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
        commentCount <- map["descendants"]
        score <- map["score"]
        title <- map["title"]
        url <- (map["url"], URLTransform())
    }
    
    // MARK: Type methods
    
    class func fetchTopStories(callback: (stories: [Story]) -> Void) {
        let apiAdapter = APIAdapter.sharedInstance
        apiAdapter.stories(forType: .Top, callback: { (stories) -> Void in
            callback(stories: stories)
        })
    }
}