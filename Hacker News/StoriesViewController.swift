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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stories"
        view.backgroundColor = UIColor.blueColor()

        view.addSubview(tableView)
        setupConstraints()
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
        
        cell.titleLabel.text = "Hello world"
        cell.pointsLabel.text = "59"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}
