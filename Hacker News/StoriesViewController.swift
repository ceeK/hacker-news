//
//  StoriesViewController.swift
//  Hacker News
//
//  Created by Chris Howell on 16/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit
import PureLayout

class StoriesViewController: UIViewController {
    private var stories: [Story] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stories"
        view.backgroundColor = UIColor.blueColor()

        view.addSubview(tableView)
        setupConstraints()
        
        print("Fetching top stories")
        Story.fetchTopStories { (stories) -> Void in
            self.stories = stories
        }
    }

    // MARK: Constraints
    
    func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: Property accessors
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.registerClass(StoryTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(StoryTableViewCell.self))
        return tableView
    }()
}

extension StoriesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(StoryTableViewCell.self))
            as? StoryTableViewCell else {
            fatalError("Unable to dequeue StoryTableViewCell")
        }
        
        let story = stories[indexPath.row]
    
        cell.titleLabel.text = story.title
        cell.commentsButton.setTitle("\(story.commentCount)", forState: .Normal)
        cell.pointsLabel.text = "\(story.score) - by \(story.by)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
}
