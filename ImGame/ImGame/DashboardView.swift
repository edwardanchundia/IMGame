//
//  DashboardView.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import PureLayout

class DashboardView: UIView {
    
    var shouldSetupConstraints = true
    
    let screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(carousel)
        self.addSubview(nameBackground)
        self.addSubview(nameLabel)
        self.addSubview(playerCollectionView)
        self.addSubview(matchStatusBackground)
        self.addSubview(matchingStatus)
        self.addSubview(getStartedButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        if shouldSetupConstraints {
            carouselViewContraints()
            joinButtonBackground()
            nameLabelConstraints()
            playerCollectionViewConstraints()
            setupStatusBackground()
            statusLabelConstraints()
            startButtonConstraints()
        }
        
        super.updateConstraints()
    }
    
    func carouselViewContraints() {
        carousel.autoPinEdge(toSuperviewEdge: .top)
        carousel.autoPinEdge(toSuperviewEdge: .left)
        carousel.autoPinEdge(toSuperviewEdge: .right)
        //carousel.autoSetDimension(.height, toSize: screenSize.height / 3)
        carousel.autoPinEdge(.bottom, to: .bottom, of: superview, withOffset: -screenSize.height / 3)
    }
    
    func nameLabelConstraints() {
        //joinMatchButton.autoSetDimension(.width, toSize: screenSize.width / 3 * 2)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 4)
        nameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: screenSize.width / 4)
        nameLabel.autoSetDimension(.height, toSize: 30)
        nameLabel.autoPinEdge(.top, to: .bottom, of: carousel, withOffset: -25)
    }
    
    func joinButtonBackground() {
        nameBackground.autoPinEdge(.left, to: .left, of: nameLabel, withOffset: -5)
        nameBackground.autoPinEdge(.top, to: .top, of: nameLabel, withOffset: -5)
        nameBackground.autoMatch(.height, to: .height, of: nameLabel)
        nameBackground.autoMatch(.width, to: .width, of: nameLabel)
    }
    
    func playerCollectionViewConstraints() {
        playerCollectionView.autoPinEdge(toSuperviewMargin: .bottom)
        playerCollectionView.autoPinEdge(toSuperviewMargin: .left)
        //playerCollectionView.autoPinEdge(toSuperviewMargin: .right)
        playerCollectionView.autoPinEdge(toSuperviewEdge: .right, withInset: screenSize.width / 5)
        playerCollectionView.autoSetDimension(.height, toSize: 75)
    }
    
    func statusLabelConstraints() {
        matchingStatus.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 30)
        matchingStatus.autoPinEdge(toSuperviewEdge: .right, withInset: screenSize.width / 3)
        matchingStatus.autoPinEdge(toSuperviewEdge: .left, withInset: screenSize.width / 3)
    }
    
    func setupStatusBackground() {
        matchStatusBackground.autoPinEdge(.left, to: .left, of: matchingStatus, withOffset: -5)
        matchStatusBackground.autoPinEdge(.top, to: .top, of: matchingStatus, withOffset: -5)
        matchStatusBackground.autoMatch(.height, to: .height, of: matchingStatus)
        matchStatusBackground.autoMatch(.width, to: .width, of: matchingStatus)
    }
    
    func startButtonConstraints() {
        getStartedButton.autoMatch(.height, to: .height, of: playerCollectionView)
        getStartedButton.autoPinEdge(.left, to: .right, of: playerCollectionView, withOffset: 10)
        getStartedButton.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        //getStartedButton.autoPinEdge(toSuperviewEdge: .bottom)
        getStartedButton.autoPinEdge(.bottom, to: .bottom, of: playerCollectionView)
        //getStartedButton.autoSetDimension(.width, toSize: screenSize.width / 5)
    }
    
    internal lazy var playerCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.black
        //collectionView.collectionViewLayout = UICollectionViewLayout()
        return collectionView
    }()
    
    internal lazy var carousel: iCarousel = {
        let car = iCarousel()
        //car.backgroundColor = UIColor.black
        car.type = .rotary
        return car
    }()
    
    internal lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Last Name"
        label.textColor = UIColor.black
        label.layer.borderWidth = 1
        label.isHidden = false
        label.textAlignment = .center
        return label
    }()
    
    internal lazy var nameBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        view.isHidden = false
        return view
    }()
    
    internal lazy var matchingStatus: UILabel = {
        let label = UILabel()
        label.text = "XX% Compatible"
        //label.backgroundColor = UIColor.black
        label.textColor = UIColor.black
        label.layer.borderWidth = 1
        //label.isHidden = false
        label.textAlignment = .center
        return label
    }()
    
    internal lazy var matchStatusBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        //view.isHidden = false
        return view
    }()
    
    internal lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Invite", for: .normal)
        button.setTitleColor(.black, for: .normal)
        //button.backgroundColor = UIColor.brown
        button.layer.borderWidth = 1
        return button
    }()
    
}
