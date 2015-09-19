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
        
        pointsLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: titleLabel, withOffset: 5.0)
        pointsLabel.autoPinEdgeToSuperviewMargin(.Left)
        pointsLabel.autoPinEdgeToSuperviewMargin(.Bottom)
    }
    
    // MARK: Property accessors

    private(set) lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Test"
        titleLabel.font = UIFont.appPrimaryFont()
        titleLabel.textAlignment = .Left
        titleLabel.textColor = UIColor.appPrimaryColor()
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
       return UIButton()
    }()
}
