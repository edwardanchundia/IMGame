//
//  LocalEventsViews.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/2/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import MapKit
import PureLayout

class LocalEventsViews: UIView {

    var shouldSetupConstraints = true
    
    var screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mapView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        if shouldSetupConstraints {
            mapViewConstraints()
            
            
            shouldSetupConstraints = false
        }
        
        
        super.updateConstraints()
    }
    
    func mapViewConstraints() {
        mapView.autoPinEdge(toSuperviewEdge: .top)
        mapView.autoPinEdge(toSuperviewEdge: .bottom)
        mapView.autoPinEdge(toSuperviewEdge: .left)
        mapView.autoPinEdge(toSuperviewEdge: .right)
    }
    
    internal lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
}
