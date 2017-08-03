//
//  MainDashboardView.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/2/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import PureLayout

class MainDashboardView: UIView {
    var shouldSetupConstraints = true
    
    var screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(welcomeLabel)
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(matchButton)
        addSubview(messagingButton)
        addSubview(localEvents)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            welcomeLabelConstraints()
            nameLabelConstraints()
            profileImageConstraints()
            buttonConstraints()
            
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    func welcomeLabelConstraints() {
        welcomeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        welcomeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        welcomeLabel.autoSetDimension(.height, toSize: 45)
        welcomeLabel.autoSetDimension(.width, toSize: screenSize.width / 2)
    }
    
    func nameLabelConstraints() {
        nameLabel.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 10)
//        nameLabel.autoPinEdge(.right, to: .right, of: welcomeLabel, withOffset: 60)
        nameLabel.autoSetDimension(.height, toSize: 45)
//        nameLabel.autoSetDimension(.width, toSize: screenSize.width / 2 + 30)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 50)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 50)
    }
    
    func profileImageConstraints() {
        profileImage.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 25)
        profileImage.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 4)
        profileImage.autoPinEdge(toSuperviewEdge: .right, withInset: screenSize.width / 4)
        profileImage.autoSetDimension(.height, toSize: screenSize.width / 4 * 2)
    }
    
    func buttonConstraints() {
        matchButton.autoPinEdge(.top, to: .bottom, of: profileImage, withOffset: 45)
        matchButton.autoSetDimension(.width, toSize: screenSize.width / 3)
        matchButton.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        matchButton.autoSetDimension(.height, toSize: 45)
        
        messagingButton.autoPinEdge(.top, to: .bottom, of: profileImage, withOffset: 45)
        messagingButton.autoSetDimension(.width, toSize: screenSize.width / 3)
        messagingButton.autoPinEdge(toSuperviewEdge: .right, withInset: 35)
        messagingButton.autoSetDimension(.height, toSize: 45)
        
        localEvents.autoSetDimension(.height, toSize: 45)
        localEvents.autoSetDimension(.width, toSize: screenSize.width / 3)
        localEvents.autoPinEdge(.top, to: .bottom, of: messagingButton, withOffset: 25)
        localEvents.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 3)
    }
    
    internal lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME"
        label.font = UIFont(name: "Noteworthy-Light", size: 40)
        //label.backgroundColor = UIColor.blue
        return label
    }()
    
    internal lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia-Italic", size: 30)
        label.textAlignment = .center
        //label.backgroundColor = UIColor.blue
        return label
    }()
    
    internal lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        return imageView
    }()
    
    internal lazy var matchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Game", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        return button
    }()
    
    internal lazy var messagingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Messages", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        return button
    }()
    
    internal lazy var localEvents: UIButton = {
        let button = UIButton()
        button.setTitle("Local Events", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        return button
    }()
}

