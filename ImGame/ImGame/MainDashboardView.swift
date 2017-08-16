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
        
        addSubview(background)
        
//        addSubview(nameBackground)
//        addSubview(localBackground)
//        addSubview(matchBackground)
//        addSubview(welcomeBackground)
//        addSubview(messageBackground)
        
//        addSubview(welcomeLabel)
//        addSubview(nameLabel)
//        addSubview(profileImage)
        addSubview(matchButton)
        addSubview(messagingButton)
        addSubview(localEvents)
        
        addSubview(logoImage)
        addSubview(profileImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            backgroundImage()
            //welcomeLabelConstraints()
            //nameLabelConstraints()
            logoConstraints()
            profileImageConstraints()
            buttonConstraints()
            
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    func backgroundImage() {
        background.autoPinEdge(toSuperviewEdge: .top)
        background.autoPinEdge(toSuperviewEdge: .bottom)
        background.autoPinEdge(toSuperviewEdge: .left)
        background.autoPinEdge(toSuperviewEdge: .right)
    }
    
    func welcomeLabelConstraints() {
        welcomeBackground.autoPinEdge(.left, to: .left, of: welcomeLabel, withOffset: -5)
        welcomeBackground.autoPinEdge(.top, to: .top, of: welcomeLabel, withOffset: -5)
        welcomeBackground.autoMatch(.height, to: .height, of: welcomeLabel)
        welcomeBackground.autoMatch(.width, to: .width, of: welcomeLabel)
        
        welcomeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        welcomeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        welcomeLabel.autoSetDimension(.height, toSize: 45)
        welcomeLabel.autoSetDimension(.width, toSize: screenSize.width / 2)
    }
    
    func nameLabelConstraints() {
        nameBackground.autoPinEdge(.left, to: .left, of: nameLabel, withOffset: -5)
        nameBackground.autoPinEdge(.top, to: .top, of: nameLabel, withOffset: -5)
        nameBackground.autoMatch(.height, to: .height, of: nameLabel)
        nameBackground.autoMatch(.width, to: .width, of: nameLabel)
        
        nameLabel.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 10)
//        nameLabel.autoPinEdge(.right, to: .right, of: welcomeLabel, withOffset: 60)
        nameLabel.autoSetDimension(.height, toSize: 45)
//        nameLabel.autoSetDimension(.width, toSize: screenSize.width / 2 + 30)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 50)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 50)
    }
    
    func logoConstraints() {
        logoImage.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        logoImage.autoPinEdge(toSuperviewEdge: .left, withInset: 145)
        logoImage.autoPinEdge(toSuperviewEdge: .right, withInset: 145)
        logoImage.autoSetDimension(.height, toSize: 90)
    }
    
    func profileImageConstraints() {
        profileImage.autoPinEdge(.top, to: .bottom, of: logoImage, withOffset: 25)
        profileImage.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 4)
        profileImage.autoPinEdge(toSuperviewEdge: .right, withInset: screenSize.width / 4)
        profileImage.autoSetDimension(.height, toSize: screenSize.width / 4 * 2)
    }
    
    func buttonConstraints() {
//        matchBackground.autoPinEdge(.left, to: .left, of: matchButton, withOffset: -5)
//        matchBackground.autoPinEdge(.top, to: .top, of: matchButton, withOffset: -5)
//        matchBackground.autoMatch(.height, to: .height, of: matchButton)
//        matchBackground.autoMatch(.width, to: .width, of: matchButton)
        
        matchButton.autoPinEdge(.top, to: .bottom, of: profileImage, withOffset: 45)
        matchButton.autoSetDimension(.width, toSize: screenSize.width / 3)
        matchButton.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        matchButton.autoSetDimension(.height, toSize: 60)
        
//        messageBackground.autoPinEdge(.left, to: .left, of: messagingButton, withOffset: -5)
//        messageBackground.autoPinEdge(.top, to: .top, of: messagingButton, withOffset: -5)
//        messageBackground.autoMatch(.height, to: .height, of: messagingButton)
//        messageBackground.autoMatch(.width, to: .width, of: messagingButton)
        
        messagingButton.autoPinEdge(.top, to: .bottom, of: profileImage, withOffset: 45)
        messagingButton.autoSetDimension(.width, toSize: screenSize.width / 3)
        messagingButton.autoPinEdge(toSuperviewEdge: .right, withInset: 35)
        messagingButton.autoSetDimension(.height, toSize: 60)
        
//        localBackground.autoPinEdge(.left, to: .left, of: localEvents, withOffset: -5)
//        localBackground.autoPinEdge(.top, to: .top, of: localEvents, withOffset: -5)
//        localBackground.autoMatch(.height, to: .height, of: localEvents)
//        localBackground.autoMatch(.width, to: .width, of: localEvents)
        
        localEvents.autoSetDimension(.height, toSize: 60)
        localEvents.autoSetDimension(.width, toSize: screenSize.width / 3)
        localEvents.autoPinEdge(.top, to: .bottom, of: messagingButton, withOffset: 35)
        localEvents.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 3)
    }
    
    
    
    internal lazy var background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Bitmap")
        return image
    }()
    
    internal lazy var welcomeBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME"
        label.font = UIFont(name: "Noteworthy-Light", size: 40)
        //label.backgroundColor = UIColor.blue
        label.layer.borderWidth = 1
        return label
    }()
    
    internal lazy var nameBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia-Italic", size: 30)
        label.textAlignment = .center
        //label.backgroundColor = UIColor.blue
        label.layer.borderWidth = 1
        return label
    }()
    
    internal lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "IMGame_Logo (1)")
        return imageView
    }()
    
    internal lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        return imageView
    }()
    
    internal lazy var matchBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var matchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-Today-100"), for: .normal)
        button.tag = 0
        //wont work without title to listen to
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        //button.layer.borderWidth = 1
        return button
    }()
    
    internal lazy var messageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var messagingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-Speech Bubble-100"), for: .normal)
        button.tag = 1
        //button.setTitleColor(.black, for: .normal)
        //button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        //button.layer.borderWidth = 1
        return button
    }()
    
    internal lazy var localBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var localEvents: UIButton = {
        let button = UIButton()
//        button.setTitle("Local Events", for: .normal)
        button.setImage(UIImage(named: "icons8-Marker-100"), for: .normal)
        button.tag = 2
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 25)
        //button.layer.borderWidth = 1
        return button
    }()
}

