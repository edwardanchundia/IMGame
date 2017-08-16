//
//  EventViews.swift
//  IMGame
//
//  Created by Edward Anchundia on 8/3/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit

class EventViews: UIView {

    var shouldSetupConstraints = true
    
    var screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(background)
        addSubview(profileImage1)
        addSubview(profileImage2)
        addSubview(profileImage3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            backgroundImage()
            photoConstraints()
            
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
    
    func photoConstraints() {
        profileImage1.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        profileImage1.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        profileImage1.autoSetDimension(.height, toSize: 150)
        profileImage1.autoSetDimension(.width, toSize: 150)
        
        profileImage2.autoPinEdge(.top, to: .bottom, of: profileImage1, withOffset: 35)
        profileImage2.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        profileImage2.autoSetDimension(.height, toSize: 150)
        profileImage2.autoSetDimension(.width, toSize: 150)
        
        profileImage3.autoPinEdge(.top, to: .bottom, of: profileImage2, withOffset: 35)
        profileImage3.autoPinEdge(toSuperviewEdge: .left, withInset: 35)
        profileImage3.autoSetDimension(.height, toSize: 150)
        profileImage3.autoSetDimension(.width, toSize: 150)
    }
    
    internal lazy var background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Bitmap")
        return image
    }()
    
    internal lazy var profileImage1: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "brandin")
        return imageView
    }()
    
    internal lazy var profileImage2: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "brandin")
        return imageView
    }()
    
    internal lazy var profileImage3: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "brandin")
        return imageView
    }()
    
    
}
