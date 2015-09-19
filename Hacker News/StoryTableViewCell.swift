//
//  StoryTableViewCell.swift
//  Hacker News
//
//  Created by Chris Howell on 16/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import UIKit
import PureLayout

class StoryTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(pointsLabel)
        contentView.addSubview(commentsButton)
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        contentView.layoutMargins = UIEdgeInsetsMake(20.0, 15.0, 20.0, 15.0)

        titleLabel.autoPinEdgeToSuperviewMargin(.Left)
        titleLabel.autoPinEdgeToSuperviewMargin(.Top)
        titleLabel.autoPinEdge(.Trailing, toEdge: .Leading, ofView: commentsButton, withOffset: -20.0)
        
        pointsLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: 5.0)
        pointsLabel.autoPinEdgeToSuperviewMargin(.Left)
        pointsLabel.autoPinEdgeToSuperviewMargin(.Bottom)
        
        commentsButton.autoPinEdgeToSuperviewMargin(.Right)
        commentsButton.autoAlignAxis(.Horizontal, toSameAxisOfView: contentView)
        commentsButton.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)
        commentsButton.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)
    }
    
    // MARK: Property accessors

    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Test"
        titleLabel.font = UIFont.appPrimaryFont()
        titleLabel.textAlignment = .Left
        titleLabel.textColor = UIColor.appTitleColor()
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private(set) lazy var infoLabel: UILabel = {
        return UILabel()
    }()
    
    private(set) lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.font = UIFont.appPrimaryFont()
        pointsLabel.textColor = UIColor.appPrimaryColor()
        pointsLabel.textAlignment = .Left
        return pointsLabel
    }()
    
    private(set) lazy var dotLabel: UILabel = {
       return UILabel()
    }()
    
    private(set) lazy var commentsButton: UIButton = {
        let commentsButton = UIButton()
        commentsButton.titleLabel?.font = UIFont.appPrimaryFont(ofSize: 12)
        
        var image = UIImage(named: "icon_comments")?.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, 5.0, 0))
        
        commentsButton.setBackgroundImage(image, forState: .Normal)
        commentsButton.contentMode = .Center
        commentsButton.setTitle("0", forState: .Normal)
        commentsButton.setTitleColor(UIColor.appPrimaryColor(), forState: .Normal)
        return commentsButton
    }()
}
