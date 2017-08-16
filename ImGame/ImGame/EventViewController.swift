//
//  EventViewController.swift
//  IMGame
//
//  Created by Edward Anchundia on 8/3/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    var eventsView: EventViews!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventsView = EventViews(frame: CGRect.zero)
        self.view.addSubview(eventsView)
        
        view.backgroundColor = UIColor.white
        
        eventsView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }

}
