//
//  DashboardViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

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
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popToPrevious))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_flip_to_back"), style: .plain, target: self, action: #selector(popToPrevious))
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Message", style: .plain, target: self, action: #selector(pushToMessagingController))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_message"), style: .plain, target: self, action: #selector(pushToMessagingController))

        fetchUser()
    }
    
    func pushToMessagingController() {
        let messageingController = MessagesController()
        navigationController?.pushViewController(messageingController, animated: true)
    }
    
    func signOutPressed() {
        do {
            try FIRAuth.auth()?.signOut()
            _ = self.navigationController?.popViewController(animated: true)
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = SignInViewController()
        //loginController.messagesController = self
        present(loginController, animated: true, completion: nil)
    }
    
    func popToPrevious() {
        self.dismiss(animated: true, completion: nil)
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
