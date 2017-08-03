//
//  BoardingView.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit

class BoardingView: UIView {
    
    var shouldSetupConstraints = true
    
    var screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(background)
        background.addSubview(logo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        if shouldSetupConstraints {
            backgroundConstraints()
            logoConstraints()
            
            shouldSetupConstraints = false
        }
        
        super.updateConstraints()
    }
    
    func logoConstraints() {
        logo.autoPinEdge(toSuperviewEdge: .top, withInset: screenSize.height / 3)
        logo.autoPinEdge(toSuperviewEdge: .left, withInset: 75)
        logo.autoPinEdge(toSuperviewEdge: .right, withInset: 75)
        logo.autoSetDimension(.height, toSize: 125)
    }
    
    func backgroundConstraints() {
        background.autoPinEdge(toSuperviewEdge: .top)
        background.autoPinEdge(toSuperviewEdge: .bottom)
        background.autoPinEdge(toSuperviewEdge: .left)
        background.autoPinEdge(toSuperviewEdge: .right)
    }
    
    internal lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IMGame_Logo_Long")
        imageView.alpha = 0
        //imageView.backgroundColor = .blue
        return imageView
    }()
    
    internal lazy var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background-2")
        //imageView.backgroundColor = .blue
        return imageView
    }()
    
}
