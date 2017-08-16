//
//  PlayerCollectionViewCell.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/1/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import PureLayout

class PlayerCollectionViewCell: UICollectionViewCell {
    var view1 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(view1)
        //view1.backgroundColor = UIColor.white
        viewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewConstraints() {
        view1.autoPinEdge(.left, to: .left, of: contentView)
        view1.autoPinEdge(.right, to: .right, of: contentView)
        view1.autoPinEdge(.bottom, to: .bottom, of: contentView)
        view1.autoPinEdge(.top, to: .top, of: contentView)
    }
    
    
}
