//
//  DashboardViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DashboardViewController: UIViewController {
    
    var dashboardView: DashboardView!
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardView = DashboardView(frame: CGRect.zero)
        self.view.addSubview(dashboardView)
        
        view.backgroundColor = UIColor.white
        
        dashboardView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        dashboardView.playerCollectionView.delegate = self
        dashboardView.playerCollectionView.dataSource = self
        dashboardView.playerCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: "Item")
        
        dashboardView.carousel.delegate = self
        dashboardView.carousel.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Message", style: .plain, target: self, action: #selector(pushToMessagingController))

        fetchUser()
    }
    
    func pushToMessagingController() {
        let messageingController = MessagesController()
        navigationController?.pushViewController(messageingController, animated: true)
    }
    
    func fetchUser() {
        FIRDatabase.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User(dictionary: dictionary)
                user.id = snapshot.key
                self.users.append(user)
                
                //this will crash because of background thread, so lets use dispatch_async to fix
                DispatchQueue.main.async(execute: {
//                    self.tableView.reloadData()
                    self.dashboardView.carousel.reloadData()
                })
                
                //                user.name = dictionary["name"]
            }
            
        }, withCancel: nil)
    }

}
