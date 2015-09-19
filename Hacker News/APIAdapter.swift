//
//  APIClient.swift
//  Hacker News
//
//  Created by Chris Howell on 19/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

//typedef enum {
//    FEventTypeChildAdded,    // 0, fired when a new child node is added to a location
//    FEventTypeChildRemoved,  // 1, fired when a child node is removed from a location
//    FEventTypeChildChanged,  // 2, fired when a child node at a location changes
//    FEventTypeChildMoved,    // 3, fired when a child node moves relative to the other child nodes at a location
//    FEventTypeValue          // 4, fired when any data changes at a location and, recursively, any children
//} FEventType;

import Foundation
import Firebase
import ObjectMapper

class APIAdapter {
    private let firebase = Firebase(url: "https://hacker-news.firebaseio.com/v0/")
    private var firebaseItem: Firebase {
        get {
            return firebase.childByAppendingPath("/item/")
        }
    }
    
    static let sharedInstance: APIAdapter! = {
        return APIAdapter()
    }()
    
    private init() {
        
    }
    
    // MARK: Public methods
    
    func topStories(callback: (stories: [Story]) -> Void ) {
        let paths = firebase.childByAppendingPath("topstories")
        
        paths.observeEventType(FEventType.Value) { (snapshot, string) -> Void in
            var topStories: [Story] = []
            if let stories = snapshot.value as? [Int] {
                for storyIdentifier in stories {
                    self.getStory(forIdentifier: storyIdentifier, withUpdates: false, callback: { (story) -> Void in
                        topStories.append(story)
                        if topStories.count == stories.count {
                            callback(stories: topStories)
                        }
                    })
                }
            }
        }
    }
    
    func getStory(forIdentifier identifier: Int, withUpdates: Bool, callback: (story: Story) -> Void) {
        let path = firebaseItem.childByAppendingPath("\(identifier)")
        
        if withUpdates == false {
            path.observeSingleEventOfType(FEventType.Value, withBlock: { (snapshot) -> Void in
                if let story = Mapper<Story>().map(snapshot.value) {
                    callback(story: story)
                }
            })
        } else {
            
        }
    }
    
    func getComment(forIdentifier identifier: Int, withUpdates: Bool, callback: (comment: Comment) -> Void) {
        let path = firebaseItem.childByAppendingPath("\(identifier)")
        
        if withUpdates == false {
            path.observeSingleEventOfType(FEventType.Value, withBlock: { (snapshot) -> Void in
                if let story = Mapper<Comment>().map(snapshot.value) {
                    callback(comment: story)
                }
            })
        } else {
            
        }
    }
}